defmodule Estated.Property do
  @moduledoc "A property record."
  @moduledoc since: "0.1.0"

  alias Estated.Address
  alias Estated.Assessment
  alias Estated.Deed
  alias Estated.MarketAssessment
  alias Estated.Owner
  alias Estated.Parcel
  alias Estated.PropertyMetadata
  alias Estated.Structure
  alias Estated.Tax
  alias Estated.Valuation

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
          metadata: PropertyMetadata.t() | nil,
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

  def cast(%{} = property) do
    Enum.reduce(property, %__MODULE__{}, fn
      {"metadata", metadata}, acc ->
        %__MODULE__{acc | metadata: PropertyMetadata.cast(metadata)}

      {"address", address}, acc ->
        %__MODULE__{acc | address: Address.cast(address)}

      {"parcel", parcel}, acc ->
        %__MODULE__{acc | parcel: Parcel.cast(parcel)}

      {"structure", structure}, acc ->
        %__MODULE__{acc | structure: Structure.cast(structure)}

      {"taxes", taxes}, acc ->
        %__MODULE__{acc | taxes: Tax.cast(taxes)}

      {"assessments", assessments}, acc ->
        %__MODULE__{acc | assessments: Assessment.cast(assessments)}

      {"market_assessments", market_assessments}, acc ->
        %__MODULE__{acc | market_assessments: MarketAssessment.cast(market_assessments)}

      {"valuation", valuation}, acc ->
        %__MODULE__{acc | valuation: Valuation.cast(valuation)}

      {"owner", owner}, acc ->
        %__MODULE__{acc | owner: Owner.cast(owner)}

      {"deeds", deeds}, acc ->
        %__MODULE__{acc | deeds: Deed.cast(deeds)}

      _, acc ->
        acc
    end)
  end

  def cast(nil) do
    nil
  end
end
