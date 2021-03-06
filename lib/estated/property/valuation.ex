defmodule Estated.Property.Valuation do
  @moduledoc "Valuation details as provided by a proprietary valuation algorithm."
  @moduledoc since: "0.2.0"

  import Estated.CastHelpers, only: [cast_date: 1]

  defstruct [
    :value,
    :high,
    :low,
    :forecast_standard_deviation,
    :date
  ]

  @typedoc "Valuation details as provided by a proprietary valuation algorithm."
  @typedoc since: "0.2.0"
  @type t :: %__MODULE__{
          value: value() | nil,
          high: high() | nil,
          low: low() | nil,
          forecast_standard_deviation: forecast_standard_deviation() | nil,
          date: date() | nil
        }

  @typedoc """
  The current property value.

  Eg. **16430**
  """
  @typedoc since: "0.2.0"
  @type value :: integer()

  @typedoc """
  The highest probable value.

  Eg. **17220**
  """
  @typedoc since: "0.2.0"
  @type high :: integer()

  @typedoc """
  The lowest probable value.

  Eg. **15780**
  """
  @typedoc since: "0.2.0"
  @type low :: integer()

  @typedoc """
  Forecast standard deviation (a percentage, 0-100).

  Eg. **55**
  """
  @typedoc since: "0.2.0"
  @type forecast_standard_deviation :: non_neg_integer()

  @typedoc """
  The date the valuation was performed.

  Eg. **2019-10-24**
  """
  @typedoc since: "0.2.0"
  @type date :: Date.t()

  @doc false
  @doc since: "0.2.0"
  @spec cast(map()) :: t()
  def cast(%{} = valuation) do
    Enum.reduce(valuation, %__MODULE__{}, &cast_field/2)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end

  defp cast_field({"value", value}, acc) do
    %__MODULE__{acc | value: value}
  end

  defp cast_field({"high", high}, acc) do
    %__MODULE__{acc | high: high}
  end

  defp cast_field({"low", low}, acc) do
    %__MODULE__{acc | low: low}
  end

  defp cast_field({"forecast_standard_deviation", forecast_standard_deviation}, acc) do
    %__MODULE__{acc | forecast_standard_deviation: forecast_standard_deviation}
  end

  defp cast_field({"date", date}, acc) do
    %__MODULE__{acc | date: cast_date(date)}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end
