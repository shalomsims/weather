defmodule Weather.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:logger, :httpoison, :poison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  # Run "deps.get" to update added dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 2.0"}
    ]
  end
end
