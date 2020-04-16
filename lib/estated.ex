defmodule Estated do
  @moduledoc """
  Documentation for `Estated`.
  """
  @moduledoc since: "0.1.0"

  alias Estated.Response

  @token System.get_env("ESTATED_TOKEN")

  @base_uri URI.parse("https://sandbox.estated.com/v4/property")

  defp http_opts do
    # https://erlef.github.io/security-wg/secure_coding_and_deployment_hardening/ssl
    [
      ssl: [
        verify: :verify_peer,
        cacerts: :certifi.cacerts(),
        depth: 99,
        customize_hostname_check: [
          match_fun: :public_key.pkix_verify_hostname_match_fun(:https)
        ]
      ]
    ]
  end

  def get_property(property_request) do
    query =
      property_request
      |> Map.from_struct()
      |> Enum.reject(&(&1 |> elem(1) |> is_nil()))
      |> Enum.into(%{})
      |> Map.put(:token, @token)

    uri =
      %URI{@base_uri | query: URI.encode_query(query)}
      |> to_string()
      |> to_charlist()

    case :httpc.request(:get, {uri, []}, http_opts(), []) do
      {:ok, {{_http_version, _status_code, _reason_phrase} = _status_line, _headers, body}} ->
        {:ok, body |> Jason.decode!() |> Response.cast()}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
