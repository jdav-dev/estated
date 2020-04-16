defmodule Estated.Address do
  @moduledoc "Address details as provided by the assessor."
  @moduledoc since: "0.1.0"

  defstruct [
    :street_number,
    :street_pre_direction,
    :street_name,
    :street_suffix,
    :street_post_direction,
    :unit_type,
    :unit_number,
    :formatted_street_address,
    :city,
    :state,
    :zip_code,
    :zip_plus_four_code,
    :carrier_code,
    :latitude,
    :longitute,
    :geocoding_accuracy,
    :census_tract
  ]

  @typedoc "Address details as provided by the assessor."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          street_number: street_number() | nil,
          street_pre_direction: street_pre_direction() | nil,
          street_name: street_name() | nil,
          street_suffix: street_suffix() | nil,
          street_post_direction: street_post_direction() | nil,
          unit_type: unit_type() | nil,
          unit_number: unit_number() | nil,
          formatted_street_address: formatted_street_address() | nil,
          city: city() | nil,
          state: state() | nil,
          zip_code: zip_code() | nil,
          zip_plus_four_code: zip_plus_four_code() | nil,
          carrier_code: carrier_code() | nil,
          latitude: latitude() | nil,
          longitute: longitute() | nil,
          geocoding_accuracy: geocoding_accuracy() | nil,
          census_tract: census_tract() | nil
        }

  @typedoc """
  Parsed street number.

  Eg. **3450**
  """
  @typedoc since: "0.1.0"
  @type street_number :: String.t()

  @typedoc "Directional appearing before the street name."
  @typedoc since: "0.1.0"
  @type street_pre_direction :: directional()

  @typedoc """
  A geographic directional.

  Eg. [**N**](https://estated.com/developers/docs/v4/property/enum-overview#Directionals)
  """
  @typedoc since: "0.1.0"
  @type directional :: String.t()

  @typedoc """
  Parsed street name.

  Numeric street names will include ordinal suffixes (st, nd, rd, th).

  Eg. **MAIN**
  """
  @typedoc since: "0.1.0"
  @type street_name :: String.t()

  @typedoc """
  Standardized and parsed street suffix abbreviation.

  Eg. [**ST**](https://estated.com/developers/docs/v4/property/enum-overview#street_suffix)
  """
  @typedoc since: "0.1.0"
  @type street_suffix :: String.t()

  @typedoc "Directional appearing after street suffix denoting quadrant."
  @typedoc since: "0.1.0"
  @type street_post_direction :: directional()

  @typedoc """
  Unit type abbreviation.

  Eg. [**APT**](https://estated.com/developers/docs/v4/property/enum-overview#unit_type)
  """
  @typedoc since: "0.1.0"
  @type unit_type :: String.t()

  @typedoc """
  Unit number (may be alphanumeric).

  Eg. **101A**
  """
  @typedoc since: "0.1.0"
  @type unit_number :: String.t()

  @typedoc """
  Combined street address (including unit).

  Eg. **1650 N 16TH ST SW APT 101**
  """
  @typedoc since: "0.1.0"
  @type formatted_street_address :: String.t()

  @typedoc """
  City name.

  Eg. **CHICAGO**
  """
  @typedoc since: "0.1.0"
  @type city :: String.t()

  @typedoc """
  State abbreviation.

  Eg. **IL**
  """
  @typedoc since: "0.1.0"
  @type state :: String.t()

  @typedoc """
  Zip code.

  Eg. **60614**
  """
  @typedoc since: "0.1.0"
  @type zip_code :: String.t()

  @typedoc """
  Four digit postal zip extension.

  Eg. **5505**
  """
  @typedoc since: "0.1.0"
  @type zip_plus_four_code :: String.t()

  @typedoc """
  USPS code for mail delivery services.

  Eg. **R001**
  """
  @typedoc since: "0.1.0"
  @type carrier_code :: String.t()

  @typedoc """
  Measured latitude for the property.

  Eg. **41.912406**
  """
  @typedoc since: "0.1.0"
  @type latitude :: float()

  @typedoc """
  Measured longitude for the property.

  Eg. **-87.649191**
  """
  @typedoc since: "0.1.0"
  @type longitute :: float()

  @typedoc """
  Describes the level of geocoding match.

  Eg. [**PARCEL CENTROID**](https://estated.com/developers/docs/v4/property/enum-overview#geocoding_accuracy)
  """
  @typedoc since: "0.1.0"
  @type geocoding_accuracy :: String.t()

  @typedoc """
  The census tract as designated by the Census Bureau.

  Eg. **10570200.002009**
  """
  @typedoc since: "0.1.0"
  @type census_tract :: String.t()

  def cast(%{} = address) do
    Enum.reduce(address, %__MODULE__{}, fn
      {"street_number", street_number}, acc ->
        %__MODULE__{acc | street_number: street_number}

      {"street_pre_direction", street_pre_direction}, acc ->
        %__MODULE__{acc | street_pre_direction: street_pre_direction}

      {"street_name", street_name}, acc ->
        %__MODULE__{acc | street_name: street_name}

      {"street_suffix", street_suffix}, acc ->
        %__MODULE__{acc | street_suffix: street_suffix}

      {"street_post_direction", street_post_direction}, acc ->
        %__MODULE__{acc | street_post_direction: street_post_direction}

      {"unit_type", unit_type}, acc ->
        %__MODULE__{acc | unit_type: unit_type}

      {"unit_number", unit_number}, acc ->
        %__MODULE__{acc | unit_number: unit_number}

      {"formatted_street_address", formatted_street_address}, acc ->
        %__MODULE__{acc | formatted_street_address: formatted_street_address}

      {"city", city}, acc ->
        %__MODULE__{acc | city: city}

      {"state", state}, acc ->
        %__MODULE__{acc | state: state}

      {"zip_code", zip_code}, acc ->
        %__MODULE__{acc | zip_code: zip_code}

      {"zip_plus_four_code", zip_plus_four_code}, acc ->
        %__MODULE__{acc | zip_plus_four_code: zip_plus_four_code}

      {"carrier_code", carrier_code}, acc ->
        %__MODULE__{acc | carrier_code: carrier_code}

      {"latitude", latitude}, acc ->
        %__MODULE__{acc | latitude: latitude}

      {"longitute", longitute}, acc ->
        %__MODULE__{acc | longitute: longitute}

      {"geocoding_accuracy", geocoding_accuracy}, acc ->
        %__MODULE__{acc | geocoding_accuracy: geocoding_accuracy}

      {"census_tract", census_tract}, acc ->
        %__MODULE__{acc | census_tract: census_tract}

      _, acc ->
        acc
    end)
  end
end
