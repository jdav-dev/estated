defmodule Estated.CastHelpers do
  @moduledoc false
  @moduledoc since: "0.1.0"

  @doc """
  Cast a `t:String.t/0` to a `t:Date.t/0`.

  Passes through invalid `t:String.t/0` values and values that are not a `t:String.t/0`.

  ## Examples

      iex> Estated.CastHelpers.cast_date("2020-04-17")
      ~D[2020-04-17]

      iex> Estated.CastHelpers.cast_date("invalid date")
      "invalid date"

      iex> Estated.CastHelpers.cast_date(nil)
      nil
  """
  @doc since: "0.1.0"
  @spec cast_date(any()) :: any()
  def cast_date(binary) when is_binary(binary) do
    case Date.from_iso8601(binary) do
      {:ok, date} -> date
      {:error, _reason} -> binary
    end
  end

  def cast_date(date) do
    date
  end

  @doc """
  Cast a `t:String.t/0` to a `t:DateTime.t/0`.

  Passes through invalid `t:String.t/0` values and values that are not a `t:String.t/0`.

  ## Examples

      iex> Estated.CastHelpers.cast_datetime("2020-04-17T11:17:22Z")
      ~U[2020-04-17T11:17:22Z]

      iex> Estated.CastHelpers.cast_datetime("invalid datetime")
      "invalid datetime"

      iex> Estated.CastHelpers.cast_datetime(nil)
      nil
  """
  @doc since: "0.1.0"
  @spec cast_datetime(any()) :: any()
  def cast_datetime(binary) when is_binary(binary) do
    case DateTime.from_iso8601(binary) do
      {:ok, datetime, _utc_offset} -> datetime
      {:error, _reason} -> binary
    end
  end

  def cast_datetime(datetime) do
    datetime
  end

  @doc """
  Cast a `t:String.t/0` to an `t:integer/0`.

  Passes through invalid `t:String.t/0` values and values that are not a `t:String.t/0`.

  ## Examples

      iex> Estated.CastHelpers.cast_integer("0")
      0

      iex> Estated.CastHelpers.cast_integer("invalid integer")
      "invalid integer"

      iex> Estated.CastHelpers.cast_integer(nil)
      nil
  """
  @doc since: "0.1.0"
  @spec cast_integer(any()) :: any()
  def cast_integer(binary) when is_binary(binary) do
    case Integer.parse(binary) do
      {integer, _remainder_of_binary} -> integer
      :error -> binary
    end
  end

  def cast_integer(integer) do
    integer
  end
end
