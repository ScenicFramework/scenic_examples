defmodule Example do
  @moduledoc """
  Documentation for `Example`.
  """

  def start(_type, _args) do
    # We load two different viewports from the config, each using a different scene.
    # Again, note that in the config we need to make sure the driver names are different or we'll only get 1 window.
    main_viewport_config = Application.get_env(:example, :viewport)
    alternate_viewport_config  = Application.get_env(:example, :viewport2)

    children = [
      {Scenic, [main_viewport_config, alternate_viewport_config]},
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
