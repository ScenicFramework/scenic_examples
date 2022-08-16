defmodule Example do
  @moduledoc """
  Documentation for `Example`.
  """

  def start(_type, _args) do
    # start the application with the default view_port loaded from the config
    children = [
      {Scenic, [Application.get_env(:example, :viewport)]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
