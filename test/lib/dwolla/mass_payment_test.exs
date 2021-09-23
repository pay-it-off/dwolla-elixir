defmodule Dwolla.MassPaymentTest do
  use ExUnit.Case

  import Dwolla.Factory

  alias Dwolla.MassPayment
  alias Plug.Conn

  setup do
    bypass = Bypass.open()
    Application.put_env(:dwolla, :root_uri, "http://localhost:#{bypass.port}/")
    {:ok, bypass: bypass}
  end

  describe "MassPayment" do
    test "initiate/2 requests POST and returns a new id", %{bypass: bypass} do
      Bypass.expect(bypass, fn conn ->
        assert "POST" == conn.method
        {k, v} = http_response_header(:mass_payment)

        conn
        |> Conn.put_resp_header(k, v)
        |> Conn.resp(201, "")
      end)

      params = %{
        _links: %{
          source: %{
            href: "https://api-uat.dwolla.com/funding-sources/sender-id"
          }
        },
        items: [
          %{
            _links: %{
              destination: %{
                href: "https://api-uat.dwolla.com/funding-sources/recip-id"
              }
            },
            amount: %{
              value: 1.00,
              currency: "USD"
            },
            metadata: %{
              batch1: "batch1"
            }
          }
        ],
        metadata: %{
          batch1: "batch1"
        },
        correlation_id: "3e17e4ad-4136-2fd3-a45d-adaa015d494c"
      }

      assert {:ok, resp} = MassPayment.initiate("token", params, "12345")
      assert resp.id == "4f4edcdc-49c2-41ca-a71c-adab014e98b9"
    end

    test "get/2 requests GET and returns Dwolla.MassPayment", %{bypass: bypass} do
      body = http_response_body(:mass_payment, :get)

      Bypass.expect(bypass, fn conn ->
        assert "GET" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} = MassPayment.get("token", "id")
      assert resp.__struct__ == Dwolla.MassPayment
      assert resp.correlation_id == "3e17e4ad-4136-2fd3-a45d-adaa015d494c"
      assert resp.created == "2021-09-22T20:18:17.000Z"
      assert resp.funding_transfer_id == "f24b8135-e21b-ec11-8138-fd945f81a1fa"
      assert resp.id == "4f4edcdc-49c2-41ca-a71c-adab014e98b9"
      assert resp.metadata == %{"batch1" => "batch1"}
      assert resp.source_funding_source_id == "e7bd5db2-f290-47c8-a3e1-c976af9146d7"
      assert resp.status == "complete"
      assert resp.total == %{"currency" => "USD", "value" => "1.00"}
      assert resp.total_fees == %{"currency" => "USD", "value" => "0.00"}
    end

    test "get_items/2 requests GET and returns [Dwolla.MassPayment.Items]", %{bypass: bypass} do
      body = http_response_body(:mass_payment_items, :get)

      Bypass.expect(bypass, fn conn ->
        assert "GET" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} = MassPayment.get_items("token", "id")
      item = hd(resp)
      assert item.__struct__ == Dwolla.MassPayment.Item
      assert item.amount == %{"currency" => "USD", "value" => "1.00"}
      assert item.dest_resource == "accounts"
      assert item.dest_resource_id == "b010e278-3831-4d09-91b0-067e6c56da72"

      assert item.errors == %Dwolla.Errors{
               code: nil,
               errors: [
                 %Dwolla.Errors.Error{
                   code: "Invalid",
                   message: "Receiver cannot be the owner of the source funding source.",
                   path: "/items/destination/href"
                 }
               ],
               message: nil
             }

      assert item.id == "61bfea12-79ba-4aeb-9a9b-4d199b48de2b"
      assert item.metadata == %{"batch1" => "batch1"}
      assert item.status == "failed"
      assert item.transfer_id == nil
    end
  end
end
