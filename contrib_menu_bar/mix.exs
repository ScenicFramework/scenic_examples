defmodule Example.MixProject do
  use Mix.Project

  def project do
    [
      app: :example,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Example, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:scenic, "~> 0.11.0-beta.0 "},
      {:scenic_driver_local, "~> 0.11.0-beta.0 "},
      {:scenic_widget_contrib, github: "scenic-contrib/scenic-widget-contrib"},
      {:truetype_metrics, "~> 0.5", runtime: false},
      {:ex_image_info, "~> 0.2.4", runtime: false},
      {:dialyxir, "~> 1.1", only: :dev, runtime: false},
      {:rename, "~> 0.1.0", only: :dev}
    ]
  end
end