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
    Enum.reduce(warning, %__MODULE__{}, &cast_field/2)
  end

  defp cast_field({"code", code}, acc) do
    %__MODULE__{acc | code: code}
  end

  defp cast_field({"title", title}, acc) do
    %__MODULE__{acc | title: title}
  end

  defp cast_field({"description", description}, acc) do
    %__MODULE__{acc | description: description}
  end

  defp cast_field({"metadata", metadata}, acc) do
    %__MODULE__{acc | metadata: WarningMetadata.cast(metadata)}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end
