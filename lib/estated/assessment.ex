defmodule Estated.Assessment do
  @moduledoc "Tax assessment information as provided by the assessor."
  @moduledoc since: "0.1.0"

  defstruct [
    :year,
    :land_value,
    :improvement_value,
    :total_value
  ]

  @typedoc "Tax assessment information as provided by the assessor."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          year: year() | nil,
          land_value: land_value() | nil,
          improvement_value: improvement_value() | nil,
          total_value: total_value() | nil
        }

  @typedoc """
  The year the assessment was performed.

  Eg. **2018**
  """
  @typedoc since: "0.1.0"
  @type year :: pos_integer()

  @typedoc """
  The current assessed land value before any exemptions in dollars.

  Eg. **2580**
  """
  @typedoc since: "0.1.0"
  @type land_value :: integer()

  @typedoc """
  The current assessed improvement value before any exemptions in dollars.

  Eg. **13300**
  """
  @typedoc since: "0.1.0"
  @type improvement_value :: integer()

  @typedoc """
  The total current assessed value of both land and improvements before any exemptions in dollars.

  Eg. **15880**
  """
  @typedoc since: "0.1.0"
  @type total_value :: integer()

  def cast(assessments) when is_list(assessments) do
    Enum.map(assessments, &cast/1)
  end

  def cast(%{} = assessment) do
    Enum.reduce(assessment, %__MODULE__{}, fn
      {"year", year}, acc ->
        %__MODULE__{acc | year: year}

      {"land_value", land_value}, acc ->
        %__MODULE__{acc | land_value: land_value}

      {"improvement_value", improvement_value}, acc ->
        %__MODULE__{acc | improvement_value: improvement_value}

      {"total_value", total_value}, acc ->
        %__MODULE__{acc | total_value: total_value}

      _, acc ->
        acc
    end)
  end
end