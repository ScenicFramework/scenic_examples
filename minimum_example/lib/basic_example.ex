defmodule BasicExample do
  @moduledoc """
  Documentation for `BasicExample`.
  """

  def start(_type, _args) do
    # load the viewport configuration from config
    main_viewport = Application.get_env(:example, :viewport)

    # start the application with the default view_port
    children = [
      {Scenic, [main_viewport]},
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
