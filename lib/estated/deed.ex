defmodule Estated.Deed do
  @moduledoc "Sale and mortgage data which constitute a deed record."
  @moduledoc since: "0.1.0"

  import Estated.CastHelpers, only: [cast_date: 1]

  defstruct [
    :document_type,
    :recording_date,
    :original_contract_date,
    :deed_book,
    :deed_page,
    :document_id,
    :sale_price,
    :sale_price_description,
    :transfer_tax,
    :distressed_sale,
    :real_estate_owned,
    :seller_first_name,
    :seller_last_name,
    :seller2_first_name,
    :seller2_last_name,
    :seller_address,
    :seller_unit_number,
    :seller_city,
    :seller_state,
    :seller_zip_code,
    :seller_zip_plus_four_code,
    :buyer_first_name,
    :buyer_last_name,
    :buyer2_first_name,
    :buyer2_last_name,
    :buyer_address,
    :buyer_unit_type,
    :buyer_unit_number,
    :buyer_city,
    :buyer_state,
    :buyer_zip_code,
    :buyer_zip_plus_four_code,
    :lender_name,
    :lender_type,
    :loan_amount,
    :loan_type,
    :loan_due_date,
    :loan_finance_type,
    :loan_interest_rate
  ]

  @typedoc "Up to 20 years of sale and mortgage data which constitute a deed record."
  @typedoc since: "0.1.0"
  @type deeds :: [t()]

  @typedoc "Sale and mortgage data which constitute a deed record."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          document_type: document_type() | nil,
          recording_date: recording_date() | nil,
          original_contract_date: original_contract_date() | nil,
          deed_book: deed_book() | nil,
          deed_page: deed_page() | nil,
          document_id: document_id() | nil,
          sale_price: sale_price() | nil,
          sale_price_description: sale_price_description() | nil,
          transfer_tax: transfer_tax() | nil,
          distressed_sale: distressed_sale() | nil,
          real_estate_owned: real_estate_owned() | nil,
          seller_first_name: seller_first_name() | nil,
          seller_last_name: seller_last_name() | nil,
          seller2_first_name: seller2_first_name() | nil,
          seller2_last_name: seller2_last_name() | nil,
          seller_address: seller_address() | nil,
          seller_unit_number: seller_unit_number() | nil,
          seller_city: seller_city() | nil,
          seller_state: seller_state() | nil,
          seller_zip_code: seller_zip_code() | nil,
          seller_zip_plus_four_code: seller_zip_plus_four_code() | nil,
          buyer_first_name: buyer_first_name() | nil,
          buyer_last_name: buyer_last_name() | nil,
          buyer2_first_name: buyer2_first_name() | nil,
          buyer2_last_name: buyer2_last_name() | nil,
          buyer_address: buyer_address() | nil,
          buyer_unit_type: buyer_unit_type() | nil,
          buyer_unit_number: buyer_unit_number() | nil,
          buyer_city: buyer_city() | nil,
          buyer_state: buyer_state() | nil,
          buyer_zip_code: buyer_zip_code() | nil,
          buyer_zip_plus_four_code: buyer_zip_plus_four_code() | nil,
          lender_name: lender_name() | nil,
          lender_type: lender_type() | nil,
          loan_amount: loan_amount() | nil,
          loan_type: loan_type() | nil,
          loan_due_date: loan_due_date() | nil,
          loan_finance_type: loan_finance_type() | nil,
          loan_interest_rate: loan_interest_rate() | nil
        }

  @typedoc """
  Type of deed document.

  Eg. [**WARRANTY DEED**](https://estated.com/developers/docs/v4/property/enum-overview#document_type)
  """
  @typedoc since: "0.1.0"
  @type document_type :: String.t()

  @typedoc """
  The official date the document was recorded.

  Eg. **2011-12-28**
  """
  @typedoc since: "0.1.0"
  @type recording_date :: Date.t()

  @typedoc """
  The date the original contract was signed.

  Eg. **2011-12-26**
  """
  @typedoc since: "0.1.0"
  @type original_contract_date :: Date.t()

  @typedoc """
  The physical book where the deed was recorded.

  Eg. **9056**
  """
  @typedoc since: "0.1.0"
  @type deed_book :: String.t()

  @typedoc """
  The physical page where the deed was recorded.

  Eg. **595**
  """
  @typedoc since: "0.1.0"
  @type deed_page :: String.t()

  @typedoc """
  Identifier assigned to document at the recording date.

  Eg. **93154L**
  """
  @typedoc since: "0.1.0"
  @type document_id :: String.t()

  @typedoc """
  The total sale price in dollars.

  Eg. **170000**
  """
  @typedoc since: "0.1.0"
  @type sale_price :: integer()

  @typedoc """
  A description of the sale.

  Eg. [**ESTIMATED**](https://estated.com/developers/docs/v4/property/enum-overview#sale_price_description)
  """
  @typedoc since: "0.1.0"
  @type sale_price_description :: String.t()

  @typedoc """
  The tax amount levied by the city, county, or a combination thereof.

  Eg. **142.03**
  """
  @typedoc since: "0.1.0"
  @type transfer_tax :: float()

  @typedoc """
  An indicator to determine if the sale was deemed to be distressed.

  Eg. **false**
  """
  @typedoc since: "0.1.0"
  @type distressed_sale :: boolean()

  @typedoc """
  An indicator used to determine the status of the transfer.

  Eg. [**NO**](https://estated.com/developers/docs/v4/property/enum-overview#real_estate_owned)
  """
  @typedoc since: "0.1.0"
  @type real_estate_owned :: String.t()

  @typedoc """
  Seller first name, or null if corporate owner.

  Eg. **JOHN**
  """
  @typedoc since: "0.1.0"
  @type seller_first_name :: String.t()

  @typedoc """
  Seller last name, or corporate name.

  Eg. **SMITH**
  """
  @typedoc since: "0.1.0"
  @type seller_last_name :: String.t()

  @typedoc """
  The second seller first name, or null if corporate owner.

  Eg. **JANE**
  """
  @typedoc since: "0.1.0"
  @type seller2_first_name :: String.t()

  @typedoc """
  The second seller last name, or corporate name.

  Eg. **SMITH**
  """
  @typedoc since: "0.1.0"
  @type seller2_last_name :: String.t()

  @typedoc """
  The seller mailing address.

  Eg. **123 MAIN ST**
  """
  @typedoc since: "0.1.0"
  @type seller_address :: String.t()

  @typedoc """
  The seller unit number.

  Eg. **1**
  """
  @typedoc since: "0.1.0"
  @type seller_unit_number :: String.t()

  @typedoc """
  The seller city.

  Eg. **PHOENIX**
  """
  @typedoc since: "0.1.0"
  @type seller_city :: String.t()

  @typedoc """
  The seller mailing state.

  Eg. **AZ**
  """
  @typedoc since: "0.1.0"
  @type seller_state :: String.t()

  @typedoc """
  Seller zip code.

  Eg. **85024**
  """
  @typedoc since: "0.1.0"
  @type seller_zip_code :: String.t()

  @typedoc """
  Seller four digit postal zip extension.

  Eg. **3019**
  """
  @typedoc since: "0.1.0"
  @type seller_zip_plus_four_code :: String.t()

  @typedoc """
  Buyer first name, or null if corporate owner.

  Eg. **JOHN**
  """
  @typedoc since: "0.1.0"
  @type buyer_first_name :: String.t()

  @typedoc """
  Buyer last name, or corporate name.

  Eg. **SMITH**
  """
  @typedoc since: "0.1.0"
  @type buyer_last_name :: String.t()

  @typedoc """
  Second buyer first name, or null if corporate owner.

  Eg. **JANE**
  """
  @typedoc since: "0.1.0"
  @type buyer2_first_name :: String.t()

  @typedoc """
  Second buyer last name, or corporate name.

  Eg. **SMITH**
  """
  @typedoc since: "0.1.0"
  @type buyer2_last_name :: String.t()

  @typedoc """
  Buyer mailing address.

  Eg. **123 MAIN ST**
  """
  @typedoc since: "0.1.0"
  @type buyer_address :: String.t()

  @typedoc """
  Buyer unit type.

  Eg. [**APT**](https://estated.com/developers/docs/v4/property/enum-overview#unit_type)
  """
  @typedoc since: "0.1.0"
  @type buyer_unit_type :: String.t()

  @typedoc """
  Buyer unit number.

  Eg. **1A**
  """
  @typedoc since: "0.1.0"
  @type buyer_unit_number :: String.t()

  @typedoc """
  Buyer mailing city.

  Eg. **DENVER**
  """
  @typedoc since: "0.1.0"
  @type buyer_city :: String.t()

  @typedoc """
  Buyer mailing state.

  Eg. **CO**
  """
  @typedoc since: "0.1.0"
  @type buyer_state :: String.t()

  @typedoc """
  Buyer mailing zip code.

  Eg. **80222**
  """
  @typedoc since: "0.1.0"
  @type buyer_zip_code :: String.t()

  @typedoc """
  Buyer four digit postal zip extension.

  Eg. **3019**
  """
  @typedoc since: "0.1.0"
  @type buyer_zip_plus_four_code :: String.t()

  @typedoc """
  Mortgage lender.

  Eg. **CITIMORTGAGE INC**
  """
  @typedoc since: "0.1.0"
  @type lender_name :: String.t()

  @typedoc """
  The type of lender.

  Eg. [**BANK**](https://estated.com/developers/docs/v4/property/enum-overview#lender_type)
  """
  @typedoc since: "0.1.0"
  @type lender_type :: String.t()

  @typedoc """
  Mortgage recorded in dollars.

  Eg. **74900**
  """
  @typedoc since: "0.1.0"
  @type loan_amount :: integer()

  @typedoc """
  Type of loan security.

  Eg. [**CLOSED MORTGAGE**](https://estated.com/developers/docs/v4/property/enum-overview#loan_type)
  """
  @typedoc since: "0.1.0"
  @type loan_type :: String.t()

  @typedoc """
  The date the mortgage will be paid in full.

  Eg. **2029-10-22**
  """
  @typedoc since: "0.1.0"
  @type loan_due_date :: Date.t()

  @typedoc """
  The interest rate type on the loan.

  Eg. [**FIXED RATE**](https://estated.com/developers/docs/v4/property/enum-overview#loan_finance_type)
  """
  @typedoc since: "0.1.0"
  @type loan_finance_type :: String.t()

  @typedoc """
  The interest rate of the loan.

  Eg. **2.97**
  """
  @typedoc since: "0.1.0"
  @type loan_interest_rate :: float()

  @doc false
  @doc since: "0.1.0"
  @spec cast_list([map()]) :: [t()]
  def cast_list(deeds) when is_list(deeds) do
    Enum.map(deeds, &cast/1)
  end

  @spec cast_list(nil) :: []
  def cast_list(nil) do
    []
  end

  defp cast(%{} = deed) do
    Enum.reduce(deed, %__MODULE__{}, &cast_field/2)
  end

  defp cast_field({"document_type", document_type}, acc) do
    %__MODULE__{acc | document_type: document_type}
  end

  defp cast_field({"recording_date", recording_date}, acc) do
    %__MODULE__{acc | recording_date: cast_date(recording_date)}
  end

  defp cast_field({"original_contract_date", original_contract_date}, acc) do
    %__MODULE__{acc | original_contract_date: cast_date(original_contract_date)}
  end

  defp cast_field({"deed_book", deed_book}, acc) do
    %__MODULE__{acc | deed_book: deed_book}
  end

  defp cast_field({"deed_page", deed_page}, acc) do
    %__MODULE__{acc | deed_page: deed_page}
  end

  defp cast_field({"document_id", document_id}, acc) do
    %__MODULE__{acc | document_id: document_id}
  end

  defp cast_field({"sale_price", sale_price}, acc) do
    %__MODULE__{acc | sale_price: sale_price}
  end

  defp cast_field({"sale_price_description", sale_price_description}, acc) do
    %__MODULE__{acc | sale_price_description: sale_price_description}
  end

  defp cast_field({"transfer_tax", transfer_tax}, acc) do
    %__MODULE__{acc | transfer_tax: transfer_tax}
  end

  defp cast_field({"distressed_sale", distressed_sale}, acc) do
    %__MODULE__{acc | distressed_sale: distressed_sale}
  end

  defp cast_field({"real_estate_owned", real_estate_owned}, acc) do
    %__MODULE__{acc | real_estate_owned: real_estate_owned}
  end

  defp cast_field({"seller_first_name", seller_first_name}, acc) do
    %__MODULE__{acc | seller_first_name: seller_first_name}
  end

  defp cast_field({"seller_last_name", seller_last_name}, acc) do
    %__MODULE__{acc | seller_last_name: seller_last_name}
  end

  defp cast_field({"seller2_first_name", seller2_first_name}, acc) do
    %__MODULE__{acc | seller2_first_name: seller2_first_name}
  end

  defp cast_field({"seller2_last_name", seller2_last_name}, acc) do
    %__MODULE__{acc | seller2_last_name: seller2_last_name}
  end

  defp cast_field({"seller_address", seller_address}, acc) do
    %__MODULE__{acc | seller_address: seller_address}
  end

  defp cast_field({"seller_unit_number", seller_unit_number}, acc) do
    %__MODULE__{acc | seller_unit_number: seller_unit_number}
  end

  defp cast_field({"seller_city", seller_city}, acc) do
    %__MODULE__{acc | seller_city: seller_city}
  end

  defp cast_field({"seller_state", seller_state}, acc) do
    %__MODULE__{acc | seller_state: seller_state}
  end

  defp cast_field({"seller_zip_code", seller_zip_code}, acc) do
    %__MODULE__{acc | seller_zip_code: seller_zip_code}
  end

  defp cast_field({"seller_zip_plus_four_code", seller_zip_plus_four_code}, acc) do
    %__MODULE__{acc | seller_zip_plus_four_code: seller_zip_plus_four_code}
  end

  defp cast_field({"buyer_first_name", buyer_first_name}, acc) do
    %__MODULE__{acc | buyer_first_name: buyer_first_name}
  end

  defp cast_field({"buyer_last_name", buyer_last_name}, acc) do
    %__MODULE__{acc | buyer_last_name: buyer_last_name}
  end

  defp cast_field({"buyer2_first_name", buyer2_first_name}, acc) do
    %__MODULE__{acc | buyer2_first_name: buyer2_first_name}
  end

  defp cast_field({"buyer2_last_name", buyer2_last_name}, acc) do
    %__MODULE__{acc | buyer2_last_name: buyer2_last_name}
  end

  defp cast_field({"buyer_address", buyer_address}, acc) do
    %__MODULE__{acc | buyer_address: buyer_address}
  end

  defp cast_field({"buyer_unit_type", buyer_unit_type}, acc) do
    %__MODULE__{acc | buyer_unit_type: buyer_unit_type}
  end

  defp cast_field({"buyer_unit_number", buyer_unit_number}, acc) do
    %__MODULE__{acc | buyer_unit_number: buyer_unit_number}
  end

  defp cast_field({"buyer_city", buyer_city}, acc) do
    %__MODULE__{acc | buyer_city: buyer_city}
  end

  defp cast_field({"buyer_state", buyer_state}, acc) do
    %__MODULE__{acc | buyer_state: buyer_state}
  end

  defp cast_field({"buyer_zip_code", buyer_zip_code}, acc) do
    %__MODULE__{acc | buyer_zip_code: buyer_zip_code}
  end

  defp cast_field({"buyer_zip_plus_four_code", buyer_zip_plus_four_code}, acc) do
    %__MODULE__{acc | buyer_zip_plus_four_code: buyer_zip_plus_four_code}
  end

  defp cast_field({"lender_name", lender_name}, acc) do
    %__MODULE__{acc | lender_name: lender_name}
  end

  defp cast_field({"lender_type", lender_type}, acc) do
    %__MODULE__{acc | lender_type: lender_type}
  end

  defp cast_field({"loan_amount", loan_amount}, acc) do
    %__MODULE__{acc | loan_amount: loan_amount}
  end

  defp cast_field({"loan_type", loan_type}, acc) do
    %__MODULE__{acc | loan_type: loan_type}
  end

  defp cast_field({"loan_due_date", loan_due_date}, acc) do
    %__MODULE__{acc | loan_due_date: cast_date(loan_due_date)}
  end

  defp cast_field({"loan_finance_type", loan_finance_type}, acc) do
    %__MODULE__{acc | loan_finance_type: loan_finance_type}
  end

  defp cast_field({"loan_interest_rate", loan_interest_rate}, acc) do
    %__MODULE__{acc | loan_interest_rate: loan_interest_rate}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end
