defmodule EstatedTest do
  use ExUnit.Case

  # get_property/3 uses invalid syntax to abbreviate the response struct
  doctest Estated, except: [get_property: 3]

  setup_all _context do
    api_key = System.get_env("ESTATED_SANDBOX_API_KEY")
    {:ok, api_key: api_key}
  end
end
