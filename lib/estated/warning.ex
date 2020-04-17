defmodule Estated.Warning do
  @moduledoc """
  Warnings happen because the input address was unable to be reconciled to a single property,
  either because the address could not be found, or a property could not be matched to a
  successfully parsed address.
  """
  @moduledoc since: "0.1.0"

  alias Estated.WarningMetadata

  defstruct [
    :code,
    :title,
    :description,
    :metadata
  ]

  @typedoc "Warning response"
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          code: code() | nil,
          title: title() | nil,
          description: description() | nil,
          metadata: WarningMetadata.t() | nil
        }

  @typedoc """
  Code describing the type of warning that occurred.

  Eg. [**PW01**](https://estated.com/developers/docs/v4/property/overview#warnings)
  """
  @typedoc since: "0.1.0"
  @type code :: String.t()

  @typedoc """
  Title of the warning.

  Eg. **Property Warning**
  """
  @typedoc since: "0.1.0"
  @type title :: String.t()

  @typedoc """
  Description of the warning.

  Eg. **No property was found for the given input**
  """
  @typedoc since: "0.1.0"
  @type description :: String.t()

  @doc false
  @doc since: "0.1.0"
  @spec cast_list([map()]) :: [t()]
  def cast_list(warnings) when is_list(warnings) do
    Enum.map(warnings, &cast/1)
  end

  @spec cast_list(nil) :: []
  def cast_list(nil) do
    []
  end

  defp cast(%{} = warning) do
    Enum.reduce(warning, %__MODULE__{}, fn
      {"code", code}, acc -> %__MODULE__{acc | code: code}
      {"title", title}, acc -> %__MODULE__{acc | title: title}
      {"description", description}, acc -> %__MODULE__{acc | description: description}
      {"metadata", metadata}, acc -> %__MODULE__{acc | metadata: WarningMetadata.cast(metadata)}
      _map_entry, acc -> acc
    end)
  end
end
