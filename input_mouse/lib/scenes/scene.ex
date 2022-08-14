defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene that will publish received events to the console.
  """
  use Scenic.Scene

  @input_classes [:cursor_button, :cursor_scroll, :cursor_pos]

  @impl Scenic.Scene
  def init(scene, _param, _opts) do
    :ok = request_input(scene, @input_classes)
    {:ok, scene}
  end

  @impl Scenic.Scene
  def handle_input({:cursor_button, {:btn_right, 0, _, _}}, _ctx, scene) do
    IO.inspect(:btn_right, label: "Cancelling Input: ")
    :ok = unrequest_input(scene)
    {:noreply, scene}
  end

  @impl Scenic.Scene
  def handle_input(evt, _ctx, scene) do
    IO.inspect(evt, label: "Input: ")
    {:noreply, scene}
  end
end
