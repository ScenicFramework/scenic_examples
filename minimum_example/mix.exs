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
      mod: {BasicExample, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:scenic, git: "https://github.com/boydm/scenic.git", branch: "v0.11"},
      {:scenic_driver_glfw, git: "https://github.com/boydm/scenic_driver_glfw.git", branch: "v0.11"},

      {:truetype_metrics, "~> 0.5", only: [:dev], runtime: false},
      {:ex_image_info, "~> 0.2.4", only: [:dev], runtime: false},

      {:dialyxir, "~> 1.1", only: :dev, runtime: false}
    ]
  end
end
