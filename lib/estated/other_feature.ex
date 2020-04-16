defmodule Estated.OtherFeature do
  @moduledoc "Feature in or around a building."
  @moduledoc since: "0.1.0"

  defstruct [
    :type,
    :sq_ft
  ]

  @typedoc "Feature in or around a building."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          type: type() | nil,
          sq_ft: sq_ft() | nil
        }

  @typedoc """
  Description of a feature in or around a building.

  Eg. [**DRIVEWAY**](https://estated.com/developers/docs/v4/property/enum-overview#other_features)
  """
  @typedoc since: "0.1.0"
  @type type :: String.t()

  @typedoc """
  Size of the feature as an integer, float, or string describing a rectangle (e.g. `"24X16"`).

  Eg. **240**
  """
  @typedoc since: "0.1.0"
  @type sq_ft :: integer() | float() | String.t()

  def cast(other_features) when is_list(other_features) do
    Enum.map(other_features, &cast/1)
  end

  def cast(%{} = other_feature) do
    Enum.reduce(other_feature, %__MODULE__{}, fn
      {"type", type}, acc -> %__MODULE__{acc | type: type}
      {"sq_ft", sq_ft}, acc -> %__MODULE__{acc | sq_ft: cast_sq_ft(sq_ft)}
      _, acc -> acc
    end)
  end

  defp cast_sq_ft(sq_ft) when is_binary(sq_ft) do
    sq_ft
    |> try_integer()
    |> try_float()
  end

  defp cast_sq_ft(sq_ft) do
    sq_ft
  end

  defp try_integer(sq_ft) when is_binary(sq_ft) do
    case Integer.parse(sq_ft) do
      {integer, _remainder_of_binary} -> integer
      :error -> sq_ft
    end
  end

  defp try_float(sq_ft) when is_binary(sq_ft) do
    case Float.parse(sq_ft) do
      {float, _remainder_of_binary} -> float
      :error -> sq_ft
    end
  end
end
