defmodule Estated.Parcel do
  @moduledoc "Parcel details as provided by the assessor."
  @moduledoc since: "0.1.0"

  defstruct apn_original: nil,
            apn_unformatted: nil,
            apn_previous: nil,
            fips_code: nil,
            depth_ft: nil,
            frontage_ft: nil,
            area_sq_ft: nil,
            area_acres: nil,
            county_name: nil,
            county_land_use_code: nil,
            county_land_use_description: nil,
            standardized_land_use_category: nil,
            standardized_land_use_type: nil,
            location_descriptions: [],
            zoning: nil,
            building_count: nil,
            tax_account_number: nil,
            legal_description: nil,
            lot_code: nil,
            lot_number: nil,
            subdivision: nil,
            municipality: nil,
            section_township_range: nil

  @typedoc "Parcel details as provided by the assessor."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          apn_original: apn_original() | nil,
          apn_unformatted: apn_unformatted() | nil,
          apn_previous: apn_previous() | nil,
          fips_code: fips_code() | nil,
          depth_ft: depth_ft() | nil,
          frontage_ft: frontage_ft() | nil,
          area_sq_ft: area_sq_ft() | nil,
          area_acres: area_acres() | nil,
          county_name: county_name() | nil,
          county_land_use_code: county_land_use_code() | nil,
          county_land_use_description: county_land_use_description() | nil,
          standardized_land_use_category: standardized_land_use_category() | nil,
          standardized_land_use_type: standardized_land_use_type() | nil,
          location_descriptions: location_descriptions(),
          zoning: zoning() | nil,
          building_count: building_count() | nil,
          tax_account_number: tax_account_number() | nil,
          legal_description: legal_description() | nil,
          lot_code: lot_code() | nil,
          lot_number: lot_number() | nil,
          subdivision: subdivision() | nil,
          municipality: municipality() | nil,
          section_township_range: section_township_range() | nil
        }

  @typedoc """
  The formatted assessor's parcel number.

  Eg. **001-090-04-02**
  """
  @typedoc since: "0.1.0"
  @type apn_original :: String.t()

  @typedoc """
  The unformatted assessor's parcel number.

  Eg. **0010900402**
  """
  @typedoc since: "0.1.0"
  @type apn_unformatted :: String.t()

  @typedoc """
  A previous assessor's parcel number, formatted.

  Eg. **001-090-04-00**
  """
  @typedoc since: "0.1.0"
  @type apn_previous :: String.t()

  @typedoc """
  Unique County identifier, first 2 digits are state FIPS.

  Eg. **12086**
  """
  @typedoc since: "0.1.0"
  @type fips_code :: String.t()

  @typedoc """
  Depth measurement of the parcel in feet.

  Eg. **120.0**
  """
  @typedoc since: "0.1.0"
  @type depth_ft :: float()

  @typedoc """
  Frontage measurement of the parcel in feet.

  Eg. **260.0**
  """
  @typedoc since: "0.1.0"
  @type frontage_ft :: float()

  @typedoc """
  Total area of the parcel in square feet.

  Eg. **31200**
  """
  @typedoc since: "0.1.0"
  @type area_sq_ft :: integer()

  @typedoc """
  Total area of the parcel in acres.

  Eg. **0.716**
  """
  @typedoc since: "0.1.0"
  @type area_acres :: float()

  @typedoc """
  The name of the county.

  Eg. **COOK**
  """
  @typedoc since: "0.1.0"
  @type county_name :: String.t()

  @typedoc """
  The land use code as provided directly from the county, without interpretation.

  Eg. **SFR01**
  """
  @typedoc since: "0.1.0"
  @type county_land_use_code :: String.t()

  @typedoc """
  The land use description as provided directly from the county, without interpretation.

  Eg. **RESIDENTIAL SINGLE DWELLING**
  """
  @typedoc since: "0.1.0"
  @type county_land_use_description :: String.t()

  @typedoc """
  The general land use category for the property, converted to a common set of values across all
  counties.

  Eg. [**MULTI-FAMILY RESIDENTIAL**](https://estated.com/developers/docs/v4/property/enum-overview#standardized_land_use_category)
  """
  @typedoc since: "0.1.0"
  @type standardized_land_use_category :: String.t()

  @typedoc """
  Describes further granularity into the land use type, converted to a common set of values across
  all counties.

  Eg. [**TOWNHOUSE**](https://estated.com/developers/docs/v4/property/enum-overview#standardized_land_use_type)
  """
  @typedoc since: "0.1.0"
  @type standardized_land_use_type :: String.t()

  @typedoc """
  List describing the location and surrounding area.

  Eg. [**In Cul-de-sac, Has Mountain view**](https://estated.com/developers/docs/v4/property/enum-overview#location_descriptions)
  """
  @typedoc since: "0.1.0"
  @type location_descriptions :: [String.t()]

  @typedoc """
  City zoning designation, unique to each incorporated area.

  Eg. **T/G**
  """
  @typedoc since: "0.1.0"
  @type zoning :: String.t()

  @typedoc """
  Count of all buildings on the property.

  Eg. **1**
  """
  @typedoc since: "0.1.0"
  @type building_count :: integer()

  @typedoc """
  Parcel identifier used by the tax assessor.

  Eg. **0134601209K**
  """
  @typedoc since: "0.1.0"
  @type tax_account_number :: String.t()

  @typedoc """
  Legal description as provided by the assessor.

  Eg. **Legal subdivision 4, Section 10, Township 82, West of the 6th Meridian, New York
  District**
  """
  @typedoc since: "0.1.0"
  @type legal_description :: String.t()

  @typedoc """
  Indicates properties with multiple or partial lots.

  Eg. [**MORE THAN ONE LOT**](https://estated.com/developers/docs/v4/property/enum-overview#lot_code)
  """
  @typedoc since: "0.1.0"
  @type lot_code :: String.t()

  @typedoc """
  Number(s) identifying individual lots making up a property, separated by a comma (,), or
  ampersand (&).  Ranges are denoted by a hyphen (-).

  Eg. **1-13,15**
  """
  @typedoc since: "0.1.0"
  @type lot_number :: String.t()

  @typedoc """
  The name of the subdivision, plat, or tract in which the property is located.

  Eg. **CRYSTAL LAKE FOREST**
  """
  @typedoc since: "0.1.0"
  @type subdivision :: String.t()

  @typedoc """
  The jurisdiction in which the property is located.

  Eg. **FELL TOWNSHIP**
  """
  @typedoc since: "0.1.0"
  @type municipality :: String.t()

  @typedoc """
  Section township range meridian identifier.

  Eg. **SEC 14 TWN 1N RNG 11E**
  """
  @typedoc since: "0.1.0"
  @type section_township_range :: String.t()

  @doc false
  @doc since: "0.1.0"
  @spec cast(map()) :: t()
  def cast(%{} = parcel) do
    Enum.reduce(parcel, %__MODULE__{}, fn
      {"apn_original", apn_original}, acc ->
        %__MODULE__{acc | apn_original: apn_original}

      {"apn_unformatted", apn_unformatted}, acc ->
        %__MODULE__{acc | apn_unformatted: apn_unformatted}

      {"apn_previous", apn_previous}, acc ->
        %__MODULE__{acc | apn_previous: apn_previous}

      {"fips_code", fips_code}, acc ->
        %__MODULE__{acc | fips_code: fips_code}

      {"depth_ft", depth_ft}, acc ->
        %__MODULE__{acc | depth_ft: depth_ft}

      {"frontage_ft", frontage_ft}, acc ->
        %__MODULE__{acc | frontage_ft: frontage_ft}

      {"area_sq_ft", area_sq_ft}, acc ->
        %__MODULE__{acc | area_sq_ft: area_sq_ft}

      {"area_acres", area_acres}, acc ->
        %__MODULE__{acc | area_acres: area_acres}

      {"county_name", county_name}, acc ->
        %__MODULE__{acc | county_name: county_name}

      {"county_land_use_code", county_land_use_code}, acc ->
        %__MODULE__{acc | county_land_use_code: county_land_use_code}

      {"county_land_use_description", county_land_use_description}, acc ->
        %__MODULE__{acc | county_land_use_description: county_land_use_description}

      {"standardized_land_use_category", standardized_land_use_category}, acc ->
        %__MODULE__{acc | standardized_land_use_category: standardized_land_use_category}

      {"standardized_land_use_type", standardized_land_use_type}, acc ->
        %__MODULE__{acc | standardized_land_use_type: standardized_land_use_type}

      {"location_descriptions", location_descriptions}, acc ->
        %__MODULE__{acc | location_descriptions: location_descriptions}

      {"zoning", zoning}, acc ->
        %__MODULE__{acc | zoning: zoning}

      {"building_count", building_count}, acc ->
        %__MODULE__{acc | building_count: building_count}

      {"tax_account_number", tax_account_number}, acc ->
        %__MODULE__{acc | tax_account_number: tax_account_number}

      {"legal_description", legal_description}, acc ->
        %__MODULE__{acc | legal_description: legal_description}

      {"lot_code", lot_code}, acc ->
        %__MODULE__{acc | lot_code: lot_code}

      {"lot_number", lot_number}, acc ->
        %__MODULE__{acc | lot_number: lot_number}

      {"subdivision", subdivision}, acc ->
        %__MODULE__{acc | subdivision: subdivision}

      {"municipality", municipality}, acc ->
        %__MODULE__{acc | municipality: municipality}

      {"section_township_range", section_township_range}, acc ->
        %__MODULE__{acc | section_township_range: section_township_range}

      _, acc ->
        acc
    end)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end
end
