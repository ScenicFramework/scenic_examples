defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene with some text.
  """
  use Scenic.Scene

  alias Scenic.Graph

  import Scenic.Primitives

  def init(scene, _param, _opts) do
    # Note that the {0,0} origin is, by default, in the upper-left corner of the screen.
    # Also note that the default pin (origin of traslation) for the rect is its center.
    # Lastly, note that a group's translation will be concatenated (combined) with the translations of things inside it.
    graph =
      Graph.build()
      |> rect({100, 100}, fill: {:color, :red}, translate: {0, 0})
      |> rect({100, 100}, fill: {:color, :green}, translate: {100, 0})
      |> rect({100, 100}, fill: {:color, :blue}, translate: {0, 100})
      |> rect({100, 100}, fill: {:color, :yellow}, translate: {100, 100})
      |> group(
        &rect(&1, {100, 100}, fill: {:color, :purple}, translate: {100, 100}),
        translate: {100, 100}
      )

    {:ok, push_graph(scene, graph)}
  end
end
