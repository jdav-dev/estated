defmodule Estated.Owner do
  @moduledoc "Current owner details taken from either the assessment."
  @moduledoc since: "0.1.0"

  defstruct [
    :name,
    :formatted_street_address,
    :unit_type,
    :unit_number,
    :city,
    :state,
    :zip_code,
    :zip_plus_four_code,
    :owner_occupied
  ]

  @typedoc "Current owner details taken from either the assessment."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          name: name() | nil,
          formatted_street_address: formatted_street_address() | nil,
          unit_type: unit_type() | nil,
          unit_number: unit_number() | nil,
          city: city() | nil,
          state: state() | nil,
          zip_code: zip_code() | nil,
          zip_plus_four_code: zip_plus_four_code() | nil,
          owner_occupied: owner_occupied() | nil
        }

  @typedoc """
  Assessed owner names.

  Eg. **"SMITH, JOHN; SMITH, JANE"** or **"SMITH JOHN & JANE"**
  """
  @typedoc since: "0.1.0"
  @type name :: String.t()

  @typedoc """
  The address where the current tax bill is mailed (not including unit).

  Eg. **123 MAIN ST**
  """
  @typedoc since: "0.1.0"
  @type formatted_street_address :: String.t()

  @typedoc """
  The unit type.

  Eg. [**APT**](https://estated.com/developers/docs/v4/property/enum-overview#unit_type)
  """
  @typedoc since: "0.1.0"
  @type unit_type :: String.t()

  @typedoc """
  The unit number.

  Eg. **104**
  """
  @typedoc since: "0.1.0"
  @type unit_number :: String.t()

  @typedoc """
  The city where the current tax bill is mailed.

  In the case it is out of the USA, the country will also be located here.

  Eg. **ATLANTA**
  """
  @typedoc since: "0.1.0"
  @type city :: String.t()

  @typedoc """
  The state abbreviation where the current tax bill is mailed; XX for out of country addresses.

  Eg. **GA**
  """
  @typedoc since: "0.1.0"
  @type state :: String.t()

  @typedoc """
  The zip code where the current tax bill is mailed.

  Eg. **30342**
  """
  @typedoc since: "0.1.0"
  @type zip_code :: String.t()

  @typedoc """
  Four digit postal zip extension for where the tax bill is mailed.

  Eg. **3019**
  """
  @typedoc since: "0.1.0"
  @type zip_plus_four_code :: String.t()

  @typedoc """
  Description of the owner occupancy.

  Can be "YES" or "PROBABLE".  Data not available if null.

  Eg. **YES**
  """
  @typedoc since: "0.1.0"
  @type owner_occupied :: String.t()

  def cast(%{} = owner) do
    Enum.reduce(owner, %__MODULE__{}, fn
      {"name", name}, acc ->
        %__MODULE__{acc | name: name}

      {"formatted_street_address", formatted_street_address}, acc ->
        %__MODULE__{acc | formatted_street_address: formatted_street_address}

      {"unit_type", unit_type}, acc ->
        %__MODULE__{acc | unit_type: unit_type}

      {"unit_number", unit_number}, acc ->
        %__MODULE__{acc | unit_number: unit_number}

      {"city", city}, acc ->
        %__MODULE__{acc | city: city}

      {"state", state}, acc ->
        %__MODULE__{acc | state: state}

      {"zip_code", zip_code}, acc ->
        %__MODULE__{acc | zip_code: zip_code}

      {"zip_plus_four_code", zip_plus_four_code}, acc ->
        %__MODULE__{acc | zip_plus_four_code: zip_plus_four_code}

      {"owner_occupied", owner_occupied}, acc ->
        %__MODULE__{acc | owner_occupied: owner_occupied}

      _, acc ->
        acc
    end)
  end
end
