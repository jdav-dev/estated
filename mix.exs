defmodule Estated.MixProject do
  use Mix.Project

  @version "0.2.0"

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
          Estated.PropertyRequest.Combined,
          Estated.PropertyRequest.FipsAndApn,
          Estated.PropertyRequest.Parsed,
          Estated.PropertyRequest.Split
        ],
        Response: [
          Estated.Response,
          Estated.Response.Metadata
        ],
        Property: [
          Estated.Property,
          Estated.Property.Metadata,
          Estated.Property.Address,
          Estated.Property.Parcel,
          Estated.Property.Structure,
          Estated.Property.Tax,
          Estated.Property.Assessment,
          Estated.Property.MarketAssessment,
          Estated.Property.Valuation,
          Estated.Property.Structure.OtherArea,
          Estated.Property.Structure.OtherFeature,
          Estated.Property.Structure.OtherImprovement,
          Estated.Property.Owner,
          Estated.Property.Deed
        ],
        Warnings: [
          Estated.Warning,
          Estated.Warning.Metadata,
          Estated.Warning.Metadata.Property
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
