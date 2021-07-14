defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene with some text.
  """
  use Scenic.Scene

  alias Scenic.Graph

  import Scenic.Primitives

  @body_offset 80
  @font_size 140

  def init(scene, _param, _opts) do
    {vp_width, _} = scene.viewport.size

    graph = Graph.build(font: :roboto, font_size: @font_size, text_align: :center)
      |> text( "42", translate: {vp_width / 2, @font_size + @body_offset} )

    { :ok, push_graph( scene, graph ) }
  end
end
