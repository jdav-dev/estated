defmodule Estated.Tax do
  @moduledoc "Tax record as provided by the assessor."
  @moduledoc since: "0.1.0"

  defstruct year: nil,
            amount: nil,
            exemptions: [],
            rate_code_area: nil

  @typedoc "Tax record as provided by the assessor."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          year: year() | nil,
          amount: amount() | nil,
          exemptions: exemptions(),
          rate_code_area: rate_code_area() | nil
        }

  @typedoc """
  The year the tax was levied.

  Eg. **2017**
  """
  @typedoc since: "0.1.0"
  @type year :: pos_integer()

  @typedoc """
  The amount of tax on the property in dollars.

  Eg. **2247**
  """
  @typedoc since: "0.1.0"
  @type amount :: integer()

  @typedoc """
  List of exemptions.

  Eg. [**Agricultural, Low Income**](https://estated.com/developers/docs/v4/property/enum-overview#exemptions)
  """
  @typedoc since: "0.1.0"
  @type exemptions :: [String.t()]

  @typedoc """
  Represents separate tax jurisdictions within the county as provided on the county tax/assessment
  roll.

  Eg. **01H**
  """
  @typedoc since: "0.1.0"
  @type rate_code_area :: String.t()

  @doc false
  @doc since: "0.1.0"
  @spec cast_list([map()]) :: [t()]
  def cast_list(taxes) when is_list(taxes) do
    Enum.map(taxes, &cast/1)
  end

  @spec cast_list(nil) :: nil
  def cast_list(nil) do
    []
  end

  defp cast(%{} = taxes) do
    Enum.reduce(taxes, %__MODULE__{}, fn
      {"year", year}, acc -> %__MODULE__{acc | year: year}
      {"amount", amount}, acc -> %__MODULE__{acc | amount: amount}
      {"exemptions", exemptions}, acc -> %__MODULE__{acc | exemptions: exemptions}
      {"rate_code_area", rate_code_area}, acc -> %__MODULE__{acc | rate_code_area: rate_code_area}
      _, acc -> acc
    end)
  end
end
