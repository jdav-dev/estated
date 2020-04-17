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
  Size in sq ft.

  Size is a string holding an integer, float, or rectangle (e.g. "24X16").

  Eg. **240**
  """
  @typedoc since: "0.1.0"
  @type sq_ft :: String.t()

  @doc false
  @doc since: "0.1.0"
  @spec cast_list([map()]) :: [t()]
  def cast_list(other_features) when is_list(other_features) do
    Enum.map(other_features, &cast/1)
  end

  @spec cast_list(nil) :: []
  def cast_list(nil) do
    []
  end

  defp cast(%{} = other_feature) do
    Enum.reduce(other_feature, %__MODULE__{}, &cast_field/2)
  end

  defp cast_field({"type", type}, acc) do
    %__MODULE__{acc | type: type}
  end

  defp cast_field({"sq_ft", sq_ft}, acc) do
    %__MODULE__{acc | sq_ft: sq_ft}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end
