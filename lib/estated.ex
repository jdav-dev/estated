defmodule Estated do
  @moduledoc """
  Elixir client for the [Estated v4 API](https://estated.com/developers/docs/v4).
  """
  @moduledoc since: "0.1.0"

  alias Estated.CombinedPropertyRequest
  alias Estated.FipsAndApnPropertyRequest
  alias Estated.ParsedPropertyRequest
  alias Estated.Response
  alias Estated.SplitPropertyRequest

  @property_uri URI.parse("https://apis.estated.com/v4/property")
  @sandbox_property_uri URI.parse("https://sandbox.estated.com/v4/property")

  @typedoc "Estated API key"
  @typedoc since: "0.1.0"
  @type api_key :: String.t()

  @typedoc """
  A property can be requested by a variety of methods.

  Choose the method based on what works best for your application.
  """
  @typedoc since: "0.1.0"
  @type property_request ::
          CombinedPropertyRequest.t()
          | FipsAndApnPropertyRequest.t()
          | ParsedPropertyRequest.t()
          | SplitPropertyRequest.t()

  @property_request_structs [
    CombinedPropertyRequest,
    FipsAndApnPropertyRequest,
    ParsedPropertyRequest,
    SplitPropertyRequest
  ]

  @typedoc """
  Options for `get_property/3`.

  ## Options

    * `:sandbox` - If `true`, use the Sandbox API, a free endpoint to test your code against.  Any
      value other than `true` will call the real Property API.  Defaults to `false`.
  """
  @typedoc since: "0.1.0"
  @type get_property_opts :: [sandbox: boolean()]

  @doc """
  Get a property with one of the available request methods.

  Returns an `:ok` tuple if the HTTP request completed successfully, regardless of whether the
  `t:Response.t/0` contains warnings or errors.  An `:error` tuple will only be returned if the
  HTTP request could not be completed.

  ## Options

    * `:sandbox` - If `true`, use the Sandbox API, a free endpoint to test your code against.  Any
      value other than `true` will call the real Property API.  Defaults to `false`.

  ## Examples

  Split property request

      iex> api_key = System.get_env("ESTATED_API_KEY")
      iex> property_request = %SplitPropertyRequest{
      ...>   street_address: "1101 Sloan St",
      ...>   city: "Scranton",
      ...>   state: "PA",
      ...>   zip_code: "18504"
      ...> }
      iex> Estated.get_property(api_key, property_request, sandbox: true)
      {:ok, %Response{...}}

  Parsed property request

      iex> api_key = System.get_env("ESTATED_API_KEY")
      iex> property_request = %ParsedPropertyRequest{
      ...>   street_number: "1101",
      ...>   street_name: "Sloan",
      ...>   street_suffix: "St",
      ...>   city: "Scranton",
      ...>   state: "PA",
      ...>   zip_code: "18504"
      ...> }
      iex> Estated.get_property(api_key, property_request, sandbox: true)
      {:ok, %Response{...}}

  Combined property request

      iex> api_key = System.get_env("ESTATED_API_KEY")
      iex> property_request = %CombinedPropertyRequest{
      ...>   combined_address: "1101 Sloan St, Scranton, PA 18504"
      ...> }
      iex> Estated.get_property(api_key, property_request, sandbox: true)
      {:ok, %Response{...}}

  FIPS code and APN property request

      iex> api_key = System.get_env("ESTATED_API_KEY")
      iex> property_request = %FipsAndApnPropertyRequest{
      ...>   fips: "42069",
      ...>   apn: "15613060014"
      ...> }
      iex> Estated.get_property(api_key, property_request, sandbox: true)
      {:ok, %Response{...}}
  """
  @doc since: "0.1.0"
  @spec get_property(api_key(), property_request(), get_property_opts()) ::
          {:ok, Response.t()} | {:error, reason :: any()}
  def get_property(api_key, %{__struct__: struct} = property_request, opts \\ [])
      when struct in @property_request_structs and is_list(opts) do
    query = query_from_property_request(api_key, property_request)
    sandbox = get_sandbox_option(opts)
    base_uri = choose_base_uri(sandbox)

    httpc_uri = format_httpc_uri(base_uri, query)
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

  defp query_from_property_request(api_key, property_request) do
    property_request
    |> Map.from_struct()
    |> Enum.reject(&(&1 |> elem(1) |> is_nil()))
    |> Enum.into(%{})
    |> Map.put(:token, api_key)
    |> URI.encode_query()
  end

  defp get_sandbox_option(opts) do
    case Keyword.get(opts, :sandbox) do
      true -> true
      _anything_other_than_true -> false
    end
  end

  defp choose_base_uri(sandbox) do
    case sandbox do
      true -> @sandbox_property_uri
      false -> @property_uri
    end
  end

  defp format_httpc_uri(base_uri, query) do
    %URI{base_uri | query: query}
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
