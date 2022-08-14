defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene with some text.
  """
  use Scenic.Scene

  alias Scenic.Graph

  import Scenic.Primitives

  @body_offset 80
  @font_size 20

  def demo_line_height(g, x_offset, y_offset) do
    g
    |> text("Line Height", translate: {x_offset, y_offset})
    |> text("1\nABC\nDEF\nGHI", translate: {x_offset, y_offset + 2 * @font_size}, line_height: 1)
    |> text("1.5\nABC\nDEF\nGHI",
      translate: {x_offset + 60, y_offset + 2 * @font_size},
      line_height: 1.5
    )
    |> text("2\nABC\nDEF\nGHI",
      translate: {x_offset + 120, y_offset + 2 * @font_size},
      line_height: 2
    )
  end

  def demo_fonts(g, x_offset, y_offset) do
    g
    |> text("Fonts", translate: {x_offset, y_offset})
    |> text("Roboto", translate: {x_offset, y_offset + 2 * @font_size})
    |> text("Fuggles", font: :fuggles, translate: {x_offset, y_offset + 3 * @font_size})
    |> text("Zen Tokyo Zoo",
      font: :zen_tokyo_zoo,
      translate: {x_offset, y_offset + 4 * @font_size}
    )
  end

  def demo_alignment(g, x_offset, y_offset) do
    g
    |> text("Alignment", translate: {x_offset, y_offset})
    |> rect({3, 3}, fill: {:color, :red}, translate: {x_offset, y_offset + 2 * @font_size})
    |> text(":left", text_align: :left, translate: {x_offset, y_offset + 2 * @font_size})
    |> rect({3, 3}, fill: {:color, :red}, translate: {x_offset, y_offset + 3 * @font_size})
    |> text(":center", text_align: :center, translate: {x_offset, y_offset + 3 * @font_size})
    |> rect({3, 3}, fill: {:color, :red}, translate: {x_offset, y_offset + 4 * @font_size})
    |> text(":right", text_align: :right, translate: {x_offset, y_offset + 4 * @font_size})
  end

  def demo_fill(g, x_offset, y_offset) do
    g
    |> text("Fill", translate: {x_offset, y_offset})
    |> text("{:color, :red}", fill: {:color, :red}, translate: {x_offset, y_offset + @font_size})
    |> text("{:color, :blue}",
      fill: {:color, :blue},
      translate: {x_offset, y_offset + 2 * @font_size}
    )
  end

  def init(scene, _param, _opts) do
    graph =
      Graph.build()
      |> demo_line_height(10, @body_offset)
      |> demo_fonts(300, @body_offset)
      |> demo_alignment(550, @body_offset)
      |> demo_fill(10, 5 * @body_offset)

    {:ok, push_graph(scene, graph)}
  end
end
