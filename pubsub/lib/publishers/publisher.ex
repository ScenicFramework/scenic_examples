defmodule Example.Publishers.Publisher do
  use GenServer

  alias Scenic.PubSub

  def start_link(_), do: GenServer.start_link(__MODULE__, :ok, name: :publisher)

  def init(_) do
    # We use `register/2` to register a channel and attach a version and description to it.
    PubSub.register(:publisher,
                    version: "1",
                    description: "A test data publisher.")

    # Register a recurring tick function to publish some random data.
    {:ok, _timer} = :timer.send_interval(1_000, :tick)

    {:ok, %{}}
  end

  def handle_info(:tick, state) do
    # When we get our tick, we publish to on the topic.
    PubSub.publish( :publisher, ~w[a b c d e f g h] |> Enum.random())
    {:noreply, state}
  end
end
