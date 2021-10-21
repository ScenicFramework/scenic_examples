defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene with some text.
  """
  use Scenic.Scene

  alias Scenic.Graph

  import Scenic.Primitives

  def init(scene, _param, _opts) do
    # Note that sprites/3 doesn't support styles or transforms, so we do that with group/2
    graph = Graph.build()
            |> sprites( { "sprites/fruit.png", [
              {{0,0}, {80, 80}, {0, 0}, {100, 100}},
              {{80,0}, {80, 80}, {80, 0}, {100, 100}},
              {{160,0}, {80, 80}, {160, 0}, {100, 100}},
              {{240,0}, {80, 80}, {240, 0}, {100, 100}},

              {{0,80}, {80, 80}, {0, 80}, {100, 100}},
              {{80,80}, {80, 80}, {80, 80}, {100, 100}},
              {{160,80}, {80, 80}, {160, 80}, {100, 100}},
              {{240,80}, {80, 80}, {240, 80}, {100, 100}},
            ]})
            |> group( fn(g) ->
              g
              |> sprites( { "sprites/fruit.png", [
                {{0,160}, {80, 80}, {0, 160}, {100, 100}},
                {{80,160}, {80, 80}, {80, 160}, {100, 100}},
                {{160,160}, {80, 80}, {160, 160}, {100, 100}},
                {{240,160}, {80, 80}, {240, 160}, {100, 100}},

                {{0,240}, {80, 80}, {0, 240}, {100, 100}},
                {{80,240}, {80, 80}, {80, 240}, {100, 100}},
                {{160,240}, {80, 80}, {160, 240}, {100, 100}},
                {{240,240}, {80, 80}, {240, 240}, {100, 100}},
              ]})
            end, translate: {200,0},rotate: 25* (:math.pi() / 180.0))

    { :ok, push_graph( scene, graph ) }
  end
end
