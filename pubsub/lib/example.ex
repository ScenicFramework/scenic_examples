defmodule Example do
  @moduledoc """
  Documentation for `Example`.
  """

  def start(_type, _args) do
    # We start both the scenic driver and our exmaple publisher.
    children = [
      {Scenic, [Application.get_env(:example, :viewport)]},
      Example.Publishers.Publisher
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
