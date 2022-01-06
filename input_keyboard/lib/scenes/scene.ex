defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene that will publish received keyboard events to the console.
  """
  use Scenic.Scene

  @input_classes [:codepoint, :key]

   @impl Scenic.Scene
  def init(scene, _param, _opts) do
    :ok = request_input(scene, @input_classes)
    { :ok, scene }
  end

  @impl Scenic.Scene
  def handle_input( {:key, {:key_x, 0, _}}, _ctx, scene ) do
    :ok = release_input(scene, @input_classes)
    IO.inspect(:key_x, label: "Cancel input: ")
    {:noreply, scene}
  end

  def handle_input( evt, _ctx, scene ) do
    IO.inspect(evt, label: "Input: ")
    {:noreply, scene}
  end
end
