defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene that will publish received events to the console.

  It demonstrates how to implement dragging and double-clicking.
  """
  use Scenic.Scene
  require Record

  Record.defrecord(:mouse_state, last_btn: nil, last_btn_time: 0, last_btn_state: nil, in_drag: false, drag_start: nil, drag_end: nil)

  @input_classes [:cursor_button,
   :cursor_scroll,
   :cursor_pos]

  @impl Scenic.Scene
  def init(scene, _param, _opts) do
    :ok = request_input(scene, @input_classes)

    mouse_state = mouse_state()
    { :ok, scene |> assign(:mouse_state, mouse_state) }
  end

  @impl Scenic.Scene
  def handle_input( evt, _ctx, scene ) do
    old_mouse_state = scene.assigns.mouse_state
    new_mouse_state = interpret_mouse_event(old_mouse_state, evt, scene)
    {:noreply, scene |> assign(:mouse_state, new_mouse_state)}
  end

  @doc """
  Function to detect mouse events, either double-clicks or drag start/resize/stop.

  To detect a click, we look for a complete cycle of down-up in the click interval.
  To detect a drag start, we look for mouse down followed by mouse move while not in the drag state.
  To detect a drag move, we look for a move while in the drag state.
  To detect a drag stop, we look for a mouse up while in the drag state.

  Note that if we wanted a double-click, the simplest thing to do would be to do a `send_event` on the click event and handle it at a layer higher.
  """
  @click_interval 250
  @button_down 1
  @button_up 0

  # single-click handling
  def interpret_mouse_event(
    mouse_state(last_btn: btn, last_btn_time: last_event_time, last_btn_state: @button_down, in_drag: false) = old_mouse_state,
    {:cursor_button, {btn, _state, _mods, position}},
    scene
    ) do
    new_event_time = System.monotonic_time(:millisecond)

    # mouse button has come up, we emit an event if this has happened quickly enough
    if (new_event_time - last_event_time) < @click_interval do
      IO.puts "#{btn} click"
      # emit an event here if so moved
    end

    mouse_state(old_mouse_state, last_btn: nil, last_btn_state: nil, last_btn_time: new_event_time)
  end
  def interpret_mouse_event(
    mouse_state(last_btn: _, last_btn_time: _, last_btn_state: _, in_drag: false) = old_mouse_state,
    {:cursor_button, {btn, _state, _mods, _position}},
    _scene
    ) do
    new_event_time = System.monotonic_time(:millisecond)

    # mouse button has come down
    mouse_state(old_mouse_state, last_btn: btn, last_btn_state: @button_down, last_btn_time: new_event_time)
  end

  # drag start handling
  def interpret_mouse_event(
    mouse_state(last_btn: _, last_btn_time: _, last_btn_state: @button_down, in_drag: false) = old_mouse_state,
    {:cursor_pos, {mx, my}},
    scene
    ) do
    new_event_time = System.monotonic_time(:millisecond)
    IO.inspect("Drag start @ #{ inspect {mx, my} }")
    mouse_state(old_mouse_state, last_btn_time: new_event_time, in_drag: true, drag_start: {mx, my})
  end

  # drag move handling
  def interpret_mouse_event(
    mouse_state(last_btn: _, last_btn_time: _, last_btn_state: @button_down, in_drag: true, drag_start: {sx, sy}, ) = old_mouse_state,
    {:cursor_pos, {mx, my}},
    scene
    ) do
    new_event_time = System.monotonic_time(:millisecond)
    IO.inspect("Drag move @ #{ inspect {sx, sy}} #{ inspect {mx, my} }")
    mouse_state(old_mouse_state, last_btn_time: new_event_time, in_drag: true, drag_end: {mx, my})
  end

  # drag stop handling
  def interpret_mouse_event(
    mouse_state(last_btn: btn, last_btn_time: _, last_btn_state: @button_down, in_drag: true, drag_start: {sx, sy}, ) = old_mouse_state,
    {:cursor_button, {btn, _state, _mods, {mx,my}}},
    scene
    ) do
    new_event_time = System.monotonic_time(:millisecond)
    IO.inspect("Drag stop @ #{ inspect {sx, sy}} #{ inspect {mx, my} }")
    mouse_state(old_mouse_state, last_btn: nil, last_btn_state: nil, last_btn_time: new_event_time, in_drag: false, drag_end: {mx, my})
  end

  # catch-all
  def interpret_mouse_event( mouse_state, evt, _) do
    mouse_state
  end
end
