defmodule Estated.Structure do
  @moduledoc "Information about the building(s) on the parcel."
  @moduledoc since: "0.1.0"

  alias Estated.OtherArea
  alias Estated.OtherFeature
  alias Estated.OtherImprovement

  defstruct year_built: nil,
            effective_year_built: nil,
            stories: nil,
            rooms_count: nil,
            beds_count: nil,
            baths: nil,
            partial_baths_count: nil,
            units_count: nil,
            parking_type: nil,
            parking_spaces_count: nil,
            pool_type: nil,
            architecture_type: nil,
            construction_type: nil,
            exterior_wall_type: nil,
            foundation_type: nil,
            roof_material_type: nil,
            roof_style_type: nil,
            heating_type: nil,
            heating_fuel_type: nil,
            air_conditioning_type: nil,
            fireplaces: nil,
            basement_type: nil,
            quality: nil,
            condition: nil,
            flooring_types: [],
            plumbing_fixtures_count: nil,
            interior_wall_type: nil,
            water_type: nil,
            sewer_type: nil,
            total_area_sq_ft: nil,
            other_areas: [],
            other_features: [],
            other_improvements: [],
            other_rooms: [],
            amenities: []

  @typedoc "Information about the building(s) on the parcel."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          year_built: year_built() | nil,
          effective_year_built: effective_year_built() | nil,
          stories: stories() | nil,
          rooms_count: rooms_count() | nil,
          beds_count: beds_count() | nil,
          baths: baths() | nil,
          partial_baths_count: partial_baths_count() | nil,
          units_count: units_count() | nil,
          parking_type: parking_type() | nil,
          parking_spaces_count: parking_spaces_count() | nil,
          pool_type: pool_type() | nil,
          architecture_type: architecture_type() | nil,
          construction_type: construction_type() | nil,
          exterior_wall_type: exterior_wall_type() | nil,
          foundation_type: foundation_type() | nil,
          roof_material_type: roof_material_type() | nil,
          roof_style_type: roof_style_type() | nil,
          heating_type: heating_type() | nil,
          heating_fuel_type: heating_fuel_type() | nil,
          air_conditioning_type: air_conditioning_type() | nil,
          fireplaces: fireplaces() | nil,
          basement_type: basement_type() | nil,
          quality: quality() | nil,
          condition: condition() | nil,
          flooring_types: flooring_types() | nil,
          plumbing_fixtures_count: plumbing_fixtures_count() | nil,
          interior_wall_type: interior_wall_type() | nil,
          water_type: water_type() | nil,
          sewer_type: sewer_type() | nil,
          total_area_sq_ft: total_area_sq_ft() | nil,
          other_areas: [OtherArea.t()],
          other_features: [OtherFeature.t()],
          other_improvements: [OtherImprovement.t()],
          other_rooms: other_rooms(),
          amenities: amenities()
        }

  @typedoc """
  The year the structure was built.

  Eg. **1923**
  """
  @typedoc since: "0.1.0"
  @type year_built :: integer()

  @typedoc """
  The year a structure was substantially updated or improved.

  Eg. **1996**
  """
  @typedoc since: "0.1.0"
  @type effective_year_built :: integer()

  @typedoc """
  The number of stories comprising the structure (may include fractional stories and alphabetic
  codes).

  Eg. **2[+A](https://estated.com/developers/docs/v4/property/enum-overview#stories)**
  """
  @typedoc since: "0.1.0"
  @type stories :: String.t()

  @typedoc """
  The total number of rooms in the building (not just bedrooms).

  Eg. **4**
  """
  @typedoc since: "0.1.0"
  @type rooms_count :: integer()

  @typedoc """
  The number of bedrooms in the building.

  Eg. **3**
  """
  @typedoc since: "0.1.0"
  @type beds_count :: integer()

  @typedoc """
  The total number of bathrooms in the building, including half baths.

  Eg. **2.5**
  """
  @typedoc since: "0.1.0"
  @type baths :: float()

  @typedoc """
  The number of partial bathrooms in the building, when available.

  Eg. **2**
  """
  @typedoc since: "0.1.0"
  @type partial_baths_count :: integer()

  @typedoc """
  Total number of units reported to the county.

  Eg. **1**
  """
  @typedoc since: "0.1.0"
  @type units_count :: integer()

  @typedoc """
  The type of parking available.

  Eg. [**DETACHED GARAGE**](https://estated.com/developers/docs/v4/property/enum-overview#parking_type)
  """
  @typedoc since: "0.1.0"
  @type parking_type :: String.t()

  @typedoc """
  The total number of available parking spaces; including garage, carport, driveway.

  Eg. **2**
  """
  @typedoc since: "0.1.0"
  @type parking_spaces_count :: integer()

  @typedoc """
  Type of pool located on the property - shared or private.

  Eg. [**HEATED POOL**](https://estated.com/developers/docs/v4/property/enum-overview#pool_type)
  """
  @typedoc since: "0.1.0"
  @type pool_type :: String.t()

  @typedoc """
  Style or historical period of the primary structure.

  Eg. [**SPANISH**](https://estated.com/developers/docs/v4/property/enum-overview#architecture_type)
  """
  @typedoc since: "0.1.0"
  @type architecture_type :: String.t()

  @typedoc """
  Type of material used in construction of the building.

  Eg. [**WOOD**](https://estated.com/developers/docs/v4/property/enum-overview#construction_type)
  """
  @typedoc since: "0.1.0"
  @type construction_type :: String.t()

  @typedoc """
  Material used for the exterior walls of the building.

  Eg. [**STUCCO**](https://estated.com/developers/docs/v4/property/enum-overview#exterior_wall_type)
  """
  @typedoc since: "0.1.0"
  @type exterior_wall_type :: String.t()

  @typedoc """
  The type of material used in the foundation.

  Eg. [**CONCRETE**](https://estated.com/developers/docs/v4/property/enum-overview#foundation_type)
  """
  @typedoc since: "0.1.0"
  @type foundation_type :: String.t()

  @typedoc """
  The material used for the roof of the building.

  Eg. [**ASPHALT**](https://estated.com/developers/docs/v4/property/enum-overview#roof_material_type)
  """
  @typedoc since: "0.1.0"
  @type roof_material_type :: String.t()

  @typedoc """
  The architectural style for the roof of the building.

  Eg. [**GABLE**](https://estated.com/developers/docs/v4/property/enum-overview#roof_style_type)
  """
  @typedoc since: "0.1.0"
  @type roof_style_type :: String.t()

  @typedoc """
  Primary heating type for the building.

  Eg. [**BASEBOARD**](https://estated.com/developers/docs/v4/property/enum-overview#heating_type)
  """
  @typedoc since: "0.1.0"
  @type heating_type :: String.t()

  @typedoc """
  Type of fuel used to heat the building.

  Eg. [**GAS**](https://estated.com/developers/docs/v4/property/enum-overview#heating_fuel_type)
  """
  @typedoc since: "0.1.0"
  @type heating_fuel_type :: String.t()

  @typedoc """
  Air conditioning type for the building.

  Eg. [**CENTRAL**](https://estated.com/developers/docs/v4/property/enum-overview#air_conditioning_type)
  """
  @typedoc since: "0.1.0"
  @type air_conditioning_type :: String.t()

  @typedoc """
  Total number of fireplaces in the building (can also be "YES")

  Eg. **2**
  """
  @typedoc since: "0.1.0"
  @type fireplaces :: String.t()

  @typedoc """
  Basement type for the building.

  Eg. [**FULL BASEMENT**](https://estated.com/developers/docs/v4/property/enum-overview#basement_type)
  """
  @typedoc since: "0.1.0"
  @type basement_type :: String.t()

  @typedoc """
  The quality of the structure rated from A+ to E+.

  This grade is determined by the county and is based on numerous, non-standard factors.  For
  example, a mobile home would likely have a lower score than a mansion as the mobile home uses
  cheaper, lower quality materials and has less features.

  Eg. **A+**
  """
  @typedoc since: "0.1.0"
  @type quality :: String.t()

  @typedoc """
  Current condition of the structure provided by the county.

  This relates to things like whether or not there is visible wear on the structure (e.g. chipped
  paint, siding falling off).  The method for determining this varies across counties.

  Eg. **FAIR**
  """
  @typedoc since: "0.1.0"
  @type condition :: String.t()

  @typedoc """
  Type of flooring used in improvements in the building.

  Eg. [**CARPET, MARBLE**](https://estated.com/developers/docs/v4/property/enum-overview#flooring_types)
  """
  @typedoc since: "0.1.0"
  @type flooring_types :: [String.t()]

  @typedoc """
  Total number of all plumbing fixtures in the building.

  Eg. **1**
  """
  @typedoc since: "0.1.0"
  @type plumbing_fixtures_count :: integer()

  @typedoc """
  The type of material used for the interior walls.

  Eg. [**PLASTER**](https://estated.com/developers/docs/v4/property/enum-overview#interior_wall_type)
  """
  @typedoc since: "0.1.0"
  @type interior_wall_type :: String.t()

  @typedoc """
  The water system for the property.

  Eg. [**MUNICIPAL**](https://estated.com/developers/docs/v4/property/enum-overview#water_type)
  """
  @typedoc since: "0.1.0"
  @type water_type :: String.t()

  @typedoc """
  The waste disposal/sewage system for the property.

  Eg. [**SEPTIC**](https://estated.com/developers/docs/v4/property/enum-overview#sewer_type)
  """
  @typedoc since: "0.1.0"
  @type sewer_type :: String.t()

  @typedoc """
  Total square footage of structure.

  Eg. **1692**
  """
  @typedoc since: "0.1.0"
  @type total_area_sq_ft :: integer()

  @typedoc """
  List of other rooms within the building.

  Eg. [**LAUNDRY ROOM, HOME OFFICE**](https://estated.com/developers/docs/v4/property/enum-overview#other_rooms)
  """
  @typedoc since: "0.1.0"
  @type other_rooms :: [String.t()]

  @typedoc """
  List of amenities included in the property.

  Eg. [**WINE CELLAR, TENNIS COURT**](https://estated.com/developers/docs/v4/property/enum-overview#amenities)
  """
  @typedoc since: "0.1.0"
  @type amenities :: [String.t()]

  @doc false
  @doc since: "0.1.0"
  @spec cast(map()) :: t()
  def cast(%{} = structure) do
    Enum.reduce(structure, %__MODULE__{}, fn
      {"year_built", year_built}, acc ->
        %__MODULE__{acc | year_built: year_built}

      {"effective_year_built", effective_year_built}, acc ->
        %__MODULE__{acc | effective_year_built: effective_year_built}

      {"stories", stories}, acc ->
        %__MODULE__{acc | stories: stories}

      {"rooms_count", rooms_count}, acc ->
        %__MODULE__{acc | rooms_count: rooms_count}

      {"beds_count", beds_count}, acc ->
        %__MODULE__{acc | beds_count: beds_count}

      {"baths", baths}, acc ->
        %__MODULE__{acc | baths: baths}

      {"partial_baths_count", partial_baths_count}, acc ->
        %__MODULE__{acc | partial_baths_count: partial_baths_count}

      {"units_count", units_count}, acc ->
        %__MODULE__{acc | units_count: units_count}

      {"parking_type", parking_type}, acc ->
        %__MODULE__{acc | parking_type: parking_type}

      {"parking_spaces_count", parking_spaces_count}, acc ->
        %__MODULE__{acc | parking_spaces_count: parking_spaces_count}

      {"pool_type", pool_type}, acc ->
        %__MODULE__{acc | pool_type: pool_type}

      {"architecture_type", architecture_type}, acc ->
        %__MODULE__{acc | architecture_type: architecture_type}

      {"construction_type", construction_type}, acc ->
        %__MODULE__{acc | construction_type: construction_type}

      {"exterior_wall_type", exterior_wall_type}, acc ->
        %__MODULE__{acc | exterior_wall_type: exterior_wall_type}

      {"foundation_type", foundation_type}, acc ->
        %__MODULE__{acc | foundation_type: foundation_type}

      {"roof_material_type", roof_material_type}, acc ->
        %__MODULE__{acc | roof_material_type: roof_material_type}

      {"roof_style_type", roof_style_type}, acc ->
        %__MODULE__{acc | roof_style_type: roof_style_type}

      {"heating_type", heating_type}, acc ->
        %__MODULE__{acc | heating_type: heating_type}

      {"heating_fuel_type", heating_fuel_type}, acc ->
        %__MODULE__{acc | heating_fuel_type: heating_fuel_type}

      {"air_conditioning_type", air_conditioning_type}, acc ->
        %__MODULE__{acc | air_conditioning_type: air_conditioning_type}

      {"fireplaces", fireplaces}, acc ->
        %__MODULE__{acc | fireplaces: fireplaces}

      {"basement_type", basement_type}, acc ->
        %__MODULE__{acc | basement_type: basement_type}

      {"quality", quality}, acc ->
        %__MODULE__{acc | quality: quality}

      {"condition", condition}, acc ->
        %__MODULE__{acc | condition: condition}

      {"flooring_types", flooring_types}, acc ->
        %__MODULE__{acc | flooring_types: flooring_types}

      {"plumbing_fixtures_count", plumbing_fixtures_count}, acc ->
        %__MODULE__{acc | plumbing_fixtures_count: plumbing_fixtures_count}

      {"interior_wall_type", interior_wall_type}, acc ->
        %__MODULE__{acc | interior_wall_type: interior_wall_type}

      {"water_type", water_type}, acc ->
        %__MODULE__{acc | water_type: water_type}

      {"sewer_type", sewer_type}, acc ->
        %__MODULE__{acc | sewer_type: sewer_type}

      {"total_area_sq_ft", total_area_sq_ft}, acc ->
        %__MODULE__{acc | total_area_sq_ft: total_area_sq_ft}

      {"other_areas", other_areas}, acc ->
        %__MODULE__{acc | other_areas: OtherArea.cast_list(other_areas)}

      {"other_features", other_features}, acc ->
        %__MODULE__{acc | other_features: OtherFeature.cast_list(other_features)}

      {"other_improvements", other_improvements}, acc ->
        %__MODULE__{acc | other_improvements: OtherImprovement.cast_list(other_improvements)}

      {"other_rooms", other_rooms}, acc ->
        %__MODULE__{acc | other_rooms: other_rooms}

      {"amenities", amenities}, acc ->
        %__MODULE__{acc | amenities: amenities}

      _, acc ->
        acc
    end)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end
end
