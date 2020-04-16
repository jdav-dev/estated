defmodule Estated.MarketAssessment do
  @moduledoc "Market assessment information as provided by the assessor."
  @moduledoc since: "0.1.0"

  defstruct [
    :year,
    :land_value,
    :improvement_value,
    :total_value
  ]

  @typedoc "Tax assessment information as provided by the assessor."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          year: year() | nil,
          land_value: land_value() | nil,
          improvement_value: improvement_value() | nil,
          total_value: total_value() | nil
        }

  @typedoc """
  The year the market assessment was performed.

  Eg. **2017**
  """
  @typedoc since: "0.1.0"
  @type year :: pos_integer()

  @typedoc """
  The market land value as determined by the assessor.

  Eg. **3000**
  """
  @typedoc since: "0.1.0"
  @type land_value :: integer()

  @typedoc """
  The market improvement value as determined by the assessor.

  Eg. **12000**
  """
  @typedoc since: "0.1.0"
  @type improvement_value :: integer()

  @typedoc """
  The total market value as determined by the assessor.

  Eg. **15000**
  """
  @typedoc since: "0.1.0"
  @type total_value :: integer()

  def cast(market_assessments) when is_list(market_assessments) do
    Enum.map(market_assessments, &cast/1)
  end

  def cast(%{} = market_assessment) do
    Enum.reduce(market_assessment, %__MODULE__{}, fn
      {"year", year}, acc ->
        %__MODULE__{acc | year: year}

      {"land_value", land_value}, acc ->
        %__MODULE__{acc | land_value: land_value}

      {"improvement_value", improvement_value}, acc ->
        %__MODULE__{acc | improvement_value: improvement_value}

      {"total_value", total_value}, acc ->
        %__MODULE__{acc | total_value: total_value}

      _, acc ->
        acc
    end)
  end
end
