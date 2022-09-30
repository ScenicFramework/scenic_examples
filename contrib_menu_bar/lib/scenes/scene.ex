defmodule Example.Scene do
  @moduledoc """
  This is a minimal scene with some text.
  """
  use Scenic.Scene

  alias Scenic.Graph

  import Scenic.Primitives

  @body_offset 200
  @font_size 72

  def init(scene, _param, _opts) do
    Process.register(self(), Example.Scene)
    {vp_width, _} = scene.viewport.size

    # pick whatever you like
    menu_bar_height = 40

    # calculate font data
    # {:ok, font_metrics} = TruetypeMetrics.load(:roboto)
    {:ok, {_type, font_metrics}} = Scenic.Assets.Static.meta(:roboto)

    # Pass in font metrics data for the MenuBar
    menu_bar_font = %{
      # This is the dize of the font for the main MenuBar (not sub-menus)
      name: :roboto,
      size: 36,
      metrics: font_metrics
    }

    sub_menu_options = %{
      # the block-height of sub-menu item rectangles
      height: 40,
      # font-size to use in the sub-menus
      font_size: 22
    }

    # see below for more explanation about this
    menu_map = calc_menu_map()

    graph =
      Graph.build(font: :roboto, font_size: @font_size, text_align: :center)
      |> text("Choose a flavor", id: :flavor, translate: {vp_width / 2, @font_size + @body_offset})
      |> ScenicWidgets.MenuBar.add_to_graph(%{
        frame:
          ScenicWidgets.Core.Structs.Frame.new(
            pin: {0, 0},
            size: {vp_width, menu_bar_height}
          ),
        menu_map: menu_map,
        item_width: {:fixed, 180},
        font: menu_bar_font,
        sub_menu: sub_menu_options
      })

    scene = assign(scene, :graph, graph)

    {:ok, push_graph(scene, graph)}
  end

  def calc_menu_map() do
    [
      {:sub_menu, "Flavors",
       [
         {"Chocolate",
          fn ->
            IO.puts("clicked: `Chocolate`!")
            send(__MODULE__, {:choose_flavor, "Chocolate"})
          end},
         {"Vanilla",
          fn ->
            IO.puts("clicked: `Vanilla`!")
            send(__MODULE__, {:choose_flavor, "Vanilla"})
          end},
         {:sub_menu, "Other",
          [
            {"Mud Pie",
             fn ->
               IO.puts("clicked: `Mud Pie`!")
               send(__MODULE__, {:choose_flavor, "Mud Pie"})
             end}
          ]}
       ]}
    ]
  end

  def handle_info({:choose_flavor, flavor}, scene) do
    text = "You choose: #{flavor}"
    graph = Graph.modify(scene.assigns.graph, :flavor, fn g -> text(g, text) end)
    scene = assign(scene, :graph, graph)
    {:noreply, push_graph(scene, graph)}
  end
end
