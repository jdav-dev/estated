defmodule Estated.DeedTest do
  use ExUnit.Case, async: true

  alias Estated.Deed

  doctest Deed

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of Deeds" do
      deeds = [
        %{
          "document_type" => "WARRANTY DEED",
          "recording_date" => "2011-12-28",
          "original_contract_date" => "2011-12-26",
          "deed_book" => "9056",
          "deed_page" => "595",
          "document_id" => "93154L",
          "sale_price" => 170_000,
          "sale_price_description" => "ESTIMATED",
          "transfer_tax" => 142.03,
          "distressed_sale" => false,
          "real_estate_owned" => "NO",
          "seller_first_name" => "JOHN",
          "seller_last_name" => "SMITH",
          "seller2_first_name" => "JANE",
          "seller2_last_name" => "SMITH",
          "seller_address" => "123 MAIN ST",
          "seller_unit_number" => "1",
          "seller_city" => "PHOENIX",
          "seller_state" => "AZ",
          "seller_zip_code" => "85024",
          "seller_zip_plus_four_code" => "3019",
          "buyer_first_name" => "JOHN",
          "buyer_last_name" => "SMITH",
          "buyer2_first_name" => "JANE",
          "buyer2_last_name" => "SMITH",
          "buyer_address" => "123 MAIN ST",
          "buyer_unit_type" => "APT",
          "buyer_unit_number" => "1A",
          "buyer_city" => "DENVER",
          "buyer_state" => "CO",
          "buyer_zip_code" => "80222",
          "buyer_zip_plus_four_code" => "3019",
          "lender_name" => "CITIMORTGAGE INC",
          "lender_type" => "BANK",
          "loan_amount" => 74_900,
          "loan_type" => "CLOSED MORTGAGE",
          "loan_due_date" => "2029-10-22",
          "loan_finance_type" => "FIXED RATE",
          "loan_interest_rate" => 2.97,
          "ignore me" => nil
        }
      ]

      assert [
               %Deed{
                 document_type: "WARRANTY DEED",
                 recording_date: ~D[2011-12-28],
                 original_contract_date: ~D[2011-12-26],
                 deed_book: "9056",
                 deed_page: "595",
                 document_id: "93154L",
                 sale_price: 170_000,
                 sale_price_description: "ESTIMATED",
                 transfer_tax: 142.03,
                 distressed_sale: false,
                 real_estate_owned: "NO",
                 seller_first_name: "JOHN",
                 seller_last_name: "SMITH",
                 seller2_first_name: "JANE",
                 seller2_last_name: "SMITH",
                 seller_address: "123 MAIN ST",
                 seller_unit_number: "1",
                 seller_city: "PHOENIX",
                 seller_state: "AZ",
                 seller_zip_code: "85024",
                 seller_zip_plus_four_code: "3019",
                 buyer_first_name: "JOHN",
                 buyer_last_name: "SMITH",
                 buyer2_first_name: "JANE",
                 buyer2_last_name: "SMITH",
                 buyer_address: "123 MAIN ST",
                 buyer_unit_type: "APT",
                 buyer_unit_number: "1A",
                 buyer_city: "DENVER",
                 buyer_state: "CO",
                 buyer_zip_code: "80222",
                 buyer_zip_plus_four_code: "3019",
                 lender_name: "CITIMORTGAGE INC",
                 lender_type: "BANK",
                 loan_amount: 74_900,
                 loan_type: "CLOSED MORTGAGE",
                 loan_due_date: ~D[2029-10-22],
                 loan_finance_type: "FIXED RATE",
                 loan_interest_rate: 2.97
               }
             ] == Deed.cast_list(deeds)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == Deed.cast_list(nil)
    end
  end
end
