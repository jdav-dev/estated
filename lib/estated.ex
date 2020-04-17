defmodule Estated do
  @moduledoc """
  Documentation for `Estated`.
  """
  @moduledoc since: "0.1.0"

  alias Estated.CombinedPropertyRequest
  alias Estated.FipsAndApnPropertyRequest
  alias Estated.ParsedPropertyRequest
  alias Estated.Response
  alias Estated.SplitPropertyRequest

  @token System.get_env("ESTATED_TOKEN")

  @base_uri URI.parse("https://sandbox.estated.com/v4/property")

  @type property_request ::
          CombinedPropertyRequest.t()
          | FipsAndApnPropertyRequest.t()
          | ParsedPropertyRequest.t()
          | SplitPropertyRequest.t()

  @spec get_property(property_request()) :: {:ok, Response.t()} | {:error, reason :: any()}
  def get_property(property_request) do
    query = query_from_property_request(property_request)

    httpc_uri = format_httpc_uri(@base_uri, query)
    httpc_request_headers = []
    httpc_request = {httpc_uri, httpc_request_headers}

    httpc_http_opts = http_opts()
    httpc_opts = []

    with {:ok, {{_http_version, _status_code, _reason_phrase} = _status_line, _headers, body}} <-
           :httpc.request(:get, httpc_request, httpc_http_opts, httpc_opts),
         {:ok, response} <- Jason.decode(body, strings: :copy) do
      {:ok, Response.cast(response)}
    end
  end

  defp query_from_property_request(property_request) do
    property_request
    |> Map.from_struct()
    |> Enum.reject(&(&1 |> elem(1) |> is_nil()))
    |> Enum.into(%{})
    |> Map.put(:token, @token)
    |> URI.encode_query()
  end

  defp format_httpc_uri(base_uri, query) do
    %URI{base_uri | query: URI.encode_query(query)}
    |> to_string()
    |> to_charlist()
  end

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
end
