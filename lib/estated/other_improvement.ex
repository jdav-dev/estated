defmodule Estated.OtherImprovement do
  @moduledoc "Improvement to a property or building."
  @moduledoc since: "0.1.0"

  defstruct [
    :type,
    :sq_ft
  ]

  @typedoc "Improvement to a property or building."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          type: type() | nil,
          sq_ft: sq_ft() | nil
        }

  @typedoc """
  Description of an improvement to a property or building.

  Eg. [**GREENHOUSE**](https://estated.com/developers/docs/v4/property/enum-overview#other_improvements)
  """
  @typedoc since: "0.1.0"
  @type type :: String.t()

  @typedoc """
  Size in sq ft.

  Size is a string holding an integer, float, or rectangle (e.g. "24X16").

  Eg. **346**
  """
  @typedoc since: "0.1.0"
  @type sq_ft :: String.t()

  @doc false
  @doc since: "0.1.0"
  @spec cast_list([map()]) :: [t()]
  def cast_list(other_improvements) when is_list(other_improvements) do
    Enum.map(other_improvements, &cast/1)
  end

  @spec cast_list(nil) :: []
  def cast_list(nil) do
    []
  end

  defp cast(%{} = other_improvement) do
    Enum.reduce(other_improvement, %__MODULE__{}, &cast_field/2)
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
