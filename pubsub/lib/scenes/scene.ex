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
    Scenic.PubSub.subscribe(:publisher)

    {vp_width, _} = scene.viewport.size

    graph = Graph.build(font: :roboto, font_size: @font_size, text_align: :center)
      |> text( "...", translate: {vp_width / 2, @font_size + @body_offset} )

    scene = scene
            |> assign( graph: graph )
            |> push_graph( graph )

    { :ok, scene }
  end

  # Once we subscribe, we need to handle three different messages in a `handle_info/2` case.
  # data published      -> `{{Scenic.PubSub, :data}, {source_id, value, timestamp}}`
  # source registered   -> `{{Scenic.PubSub, :registered}, {source_id, opts}}`
  # source unregistered -> `{{Scenic.PubSub, :unregistered}, source_id}`
  def handle_info({{Scenic.PubSub, :data}, {:publisher, value, _timestamp}},  scene) do
    IO.inspect("Data arrived.")

    # For demonstration reasons, we'll log all of the active sources.
    IO.inspect( Scenic.PubSub.list(), label: "Source list >>> ")

    # For demonstration reasons, we show the most recent value.
    {:ok, datapoint} = Scenic.PubSub.get(:publisher)
    IO.inspect( datapoint, label: "Datapoint >>> " )

    {vp_width, _} = scene.viewport.size

    # It'd probably be a better idea to use something like `Graph.modify/3` here, but we keep it simple.
    graph = Graph.build(font: :roboto, font_size: @font_size, text_align: :center)
            |> text( value , translate: {vp_width / 2, @font_size + @body_offset} )

    scene = scene
            |> assign( graph: graph )
            |> push_graph( graph )

    {:noreply, scene}
  end
  def handle_info({{Scenic.PubSub, :registered}, {:publisher, _opts}},  scene) do
    IO.inspect("Channel registered.")
    {:noreply, scene}
  end
  def handle_info({{Scenic.PubSub, :unregistered}, :publisher}, scene) do
    IO.inspect("Channel unregistered.")
    {:noreply, scene}
  end
end
