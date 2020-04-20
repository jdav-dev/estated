defmodule Estated.Property do
  @moduledoc "A property record."
  @moduledoc since: "0.1.0"

  alias Estated.Property.Address
  alias Estated.Property.Assessment
  alias Estated.Property.Deed
  alias Estated.Property.MarketAssessment
  alias Estated.Property.Metadata
  alias Estated.Property.Owner
  alias Estated.Property.Parcel
  alias Estated.Property.Structure
  alias Estated.Property.Tax
  alias Estated.Property.Valuation

  defstruct [
    :metadata,
    :address,
    :parcel,
    :structure,
    :taxes,
    :assessments,
    :market_assessments,
    :valuation,
    :owner,
    :deeds
  ]

  @typedoc "A property record."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          metadata: Metadata.t() | nil,
          address: Address.t() | nil,
          parcel: Parcel.t() | nil,
          structure: Structure.t() | nil,
          taxes: [Tax.t()],
          assessments: [Assessment.t()],
          market_assessments: [MarketAssessment.t()],
          valuation: Valuation.t() | nil,
          owner: Owner.t() | nil,
          deeds: Deed.deeds()
        }

  @doc false
  @doc since: "0.1.0"
  @spec cast(map()) :: t()
  def cast(%{} = property) do
    Enum.reduce(property, %__MODULE__{}, &cast_field/2)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end

  defp cast_field({"metadata", metadata}, acc) do
    %__MODULE__{acc | metadata: Metadata.cast(metadata)}
  end

  defp cast_field({"address", address}, acc) do
    %__MODULE__{acc | address: Address.cast(address)}
  end

  defp cast_field({"parcel", parcel}, acc) do
    %__MODULE__{acc | parcel: Parcel.cast(parcel)}
  end

  defp cast_field({"structure", structure}, acc) do
    %__MODULE__{acc | structure: Structure.cast(structure)}
  end

  defp cast_field({"taxes", taxes}, acc) do
    %__MODULE__{acc | taxes: Tax.cast_list(taxes)}
  end

  defp cast_field({"assessments", assessments}, acc) do
    %__MODULE__{acc | assessments: Assessment.cast_list(assessments)}
  end

  defp cast_field({"market_assessments", market_assessments}, acc) do
    %__MODULE__{acc | market_assessments: MarketAssessment.cast_list(market_assessments)}
  end

  defp cast_field({"valuation", valuation}, acc) do
    %__MODULE__{acc | valuation: Valuation.cast(valuation)}
  end

  defp cast_field({"owner", owner}, acc) do
    %__MODULE__{acc | owner: Owner.cast(owner)}
  end

  defp cast_field({"deeds", deeds}, acc) do
    %__MODULE__{acc | deeds: Deed.cast_list(deeds)}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end
