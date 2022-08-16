defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene with some text.
  """
  use Scenic.Scene

  alias Scenic.Graph

  import Scenic.Primitives

  def init(scene, _param, _opts) do
    graph =
      Graph.build()
      |> rect({25, 25}, fill: {:color, :green}, translate: {0, 0})
      |> arc({25, 3.141597}, fill: {:color, :red}, translate: {150, 150})
      |> circle(25, fill: {:color, :blue}, translate: {250, 250})
      |> ellipse({20, 40}, fill: {:color, {255, 128, 128}}, translate: {300, 300})
      |> line({{40, 40}, {450, 450}})
      |> path(
        [
          :begin,
          {:move_to, 10, 20},
          {:line_to, 30, 40},
          {:bezier_to, 10, 11, 20, 21, 30, 40},
          {:quadratic_to, 10, 11, 50, 60},
          {:arc_to, 70, 80, 90, 100, 20},
          :close_path
        ],
        stroke: {4, :blue},
        cap: :round,
        t: {400, 200}
      )

    scene =
      scene
      |> assign(graph: graph)
      |> push_graph(graph)

    {:ok, scene}
  end
end
