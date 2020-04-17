defmodule Estated.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :estated,
      version: @version,
      elixir: "~> 1.10",
      name: "Estated",
      description: "Elixir client for the Estated v4 API.",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :inets, :ssl]
    ]
  end

  defp deps do
    [
      {:certifi, "~> 2.5"},
      {:credo, "~> 1.3", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21.3", only: :dev, runtime: false},
      {:jason, "~> 1.2"}
    ]
  end

  defp docs do
    [
      main: "Estated",
      source_ref: "v#{@version}",
      source_url: "https://github.com/jdav-dev/estated",
      extras: ["README.md"],
      groups_for_modules: [
        Requests: [
          Estated.CombinedPropertyRequest,
          Estated.FipsAndApnPropertyRequest,
          Estated.ParsedPropertyRequest,
          Estated.SplitPropertyRequest
        ],
        Response: [
          Estated.Response,
          Estated.ResponseMetadata
        ],
        Property: [
          Estated.Property,
          Estated.PropertyMetadata,
          Estated.Address,
          Estated.Parcel,
          Estated.Structure,
          Estated.Tax,
          Estated.Assessment,
          Estated.MarketAssessment,
          Estated.Valuation,
          Estated.OtherArea,
          Estated.OtherFeature,
          Estated.OtherImprovement,
          Estated.Owner,
          Estated.Deed
        ],
        Warnings: [
          Estated.Warning,
          Estated.WarningMetadata,
          Estated.WarningMetadataProperty
        ],
        Errors: [
          Estated.Error
        ]
      ]
    ]
  end

  defp package do
    %{
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/jdav-dev/estated"}
    }
  end
end
