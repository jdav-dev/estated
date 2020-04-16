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

  def cast(other_areas) when is_list(other_areas) do
    Enum.map(other_areas, &cast/1)
  end

  def cast(%{} = other_area) do
    Enum.reduce(other_area, %__MODULE__{}, fn
      {"type", type}, acc -> %__MODULE__{acc | type: type}
      {"sq_ft", sq_ft}, acc -> %__MODULE__{acc | sq_ft: cast_integer(sq_ft)}
      _, acc -> acc
    end)
  end

  defp cast_integer(integer_string) when is_binary(integer_string) do
    case Integer.parse(integer_string) do
      {integer, _remainder_of_binary} -> integer
      :error -> integer_string
    end
  end

  defp cast_integer(integer) do
    integer
  end
end
