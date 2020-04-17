defmodule Estated.OtherArea do
  @moduledoc "Area within a building."
  @moduledoc since: "0.1.0"

  defstruct [
    :type,
    :sq_ft
  ]

  @typedoc "Area within a building."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          type: type() | nil,
          sq_ft: sq_ft() | nil
        }

  @typedoc """
  Description of an area within a building.

  Eg. [**1ST FLOOR**](https://estated.com/developers/docs/v4/property/enum-overview#other_areas)
  """
  @typedoc since: "0.1.0"
  @type type :: String.t()

  @typedoc """
  Size of the area in sq ft.

  Eg. **1140**
  """
  @typedoc since: "0.1.0"
  @type sq_ft :: integer()

  @doc false
  @doc since: "0.1.0"
  @spec cast_list([map()]) :: [t()]
  def cast_list(other_areas) when is_list(other_areas) do
    Enum.map(other_areas, &cast/1)
  end

  @spec cast_list(nil) :: []
  def cast_list(nil) do
    []
  end

  defp cast(%{} = other_area) do
    Enum.reduce(other_area, %__MODULE__{}, &cast_field/2)
  end

  defp cast_field({"type", type}, acc) do
    %__MODULE__{acc | type: type}
  end

  defp cast_field({"sq_ft", sq_ft}, acc) do
    %__MODULE__{acc | sq_ft: cast_integer(sq_ft)}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end

  defp cast_integer(binary) when is_binary(binary) do
    case Integer.parse(binary) do
      {integer, _remainder_of_binary} -> integer
      :error -> binary
    end
  end

  defp cast_integer(integer) do
    integer
  end
end
