defmodule Estated.Error do
  @moduledoc """
  Errors happen either because a problem occured with the key or the request.  The level at which
  the result provides an error differs based on where the error occurs within the request.  Error
  codes will be provided in an error response.
  """
  @moduledoc since: "0.1.0"

  defstruct [
    :code,
    :status_code,
    :title,
    :description,
    :metadata
  ]

  @typedoc "Error response."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          code: code() | nil,
          status_code: status_code() | nil,
          title: title() | nil,
          description: description() | nil,
          metadata: metadata() | nil
        }

  @typedoc "
  Code describing the type of error that occurred.

  Eg. [**APE01**](https://estated.com/developers/docs/v4/property/overview#errors)
  "
  @typedoc since: "0.1.0"
  @type code :: String.t()

  @typedoc """
  The HTTP status code.

  Eg. **500**
  """
  @typedoc since: "0.1.0"
  @type status_code :: pos_integer()

  @typedoc """
  Title of the error.

  Eg. **Internal Server Error**
  """
  @typedoc since: "0.1.0"
  @type title :: String.t()

  @typedoc """
  Description of the error.

  Eg. **An exception occurred when attempting to process your request**
  """
  @typedoc since: "0.1.0"
  @type description :: String.t()

  @typedoc "Metadata related to the error."
  @typedoc since: "0.1.0"
  @type metadata :: map()

  @doc false
  @doc since: "0.1.0"
  @spec cast(map()) :: t()
  def cast(%{} = error) do
    Enum.reduce(error, %__MODULE__{}, fn
      {"code", code}, acc -> %__MODULE__{acc | code: code}
      {"status_code", status_code}, acc -> %__MODULE__{acc | status_code: status_code}
      {"title", title}, acc -> %__MODULE__{acc | title: title}
      {"description", description}, acc -> %__MODULE__{acc | description: description}
      {"metadata", metadata}, acc -> %__MODULE__{acc | metadata: metadata}
      _, acc -> acc
    end)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end
end
