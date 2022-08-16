defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene that will publish received events to the console.
  """
  use Scenic.Scene

  @input_classes [:viewport]

  @impl Scenic.Scene
  def init(scene, _param, _opts) do
    :ok = request_input(scene, @input_classes)
    {:ok, scene}
  end

  @impl Scenic.Scene
  def handle_input(evt, _ctx, scene) do
    IO.inspect(evt, label: "Input: ")
    {:noreply, scene}
  end
end
