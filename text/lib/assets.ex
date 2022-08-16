defmodule Example.Assets do
  use Scenic.Assets.Static,
    otp_app: :example,
    alias: [
      fuggles: "fonts/Fuggles-Regular.ttf",
      zen_tokyo_zoo: "fonts/ZenTokyoZoo-Regular.ttf"
    ]
end
