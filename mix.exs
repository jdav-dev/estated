defmodule Estated.MixProject do
  use Mix.Project

  def project do
    [
      app: :estated,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :inets, :ssl]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:certifi, "~> 2.5"},
      {:ex_doc, "~> 0.21.3", only: :dev, runtime: false},
      {:jason, "~> 1.2"}
    ]
  end
end
