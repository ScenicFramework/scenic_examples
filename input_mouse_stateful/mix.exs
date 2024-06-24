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
      {:scenic, git: "https://github.com/ScenicFramework/scenic.git", branch: "main", override: true},
      {:scenic_driver_local, git: "https://github.com/ScenicFramework/scenic_driver_local.git", branch: "main"},
      {:truetype_metrics, "~> 0.5", runtime: false},
      {:ex_image_info, "~> 0.2.4", runtime: false},
      {:dialyxir, "~> 1.1", only: :dev, runtime: false}
    ]
  end
end
