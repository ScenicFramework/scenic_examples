import Config

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# should normally live in config.exs of the device app
config :scenic, :assets,
  module: Example.Assets,
  alias: []

config :logger, :console, format: "[$level] $message\n"

# Configure the two viewports for the scenic application
# Note that we can point them at different scenes, but to get two windows
# we **have** to have different driver names.
config :example, :viewport,
  name: :main_viewport,
  size: {800, 600},
  default_scene: Example.Scene,
  drivers: [
    [
      module: Scenic.Driver.Local,
      window: [title: "Viewport 1", resizeable: true],
      on_close: :stop_system
    ]
  ]

config :example, :viewport2,
  name: :secondary_viewport,
  size: {800, 600},
  default_scene: Example.Scene2,
  drivers: [
    [
      module: Scenic.Driver.Local,
      window: [title: "Viewport 2", resizeable: true],
      on_close: :stop_system
    ]
  ]
