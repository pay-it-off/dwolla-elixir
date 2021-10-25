defmodule Dwolla.FundingSourceTest do
  use ExUnit.Case

  import Dwolla.Factory

  alias Dwolla.FundingSource
  alias Plug.Conn

  setup do
    bypass = Bypass.open()
    Application.put_env(:dwolla, :root_uri, "http://localhost:#{bypass.port}/")
    {:ok, bypass: bypass}
  end

  describe "funding-source" do
    test "get/2 requests GET and returns Dwolla.FundingSource", %{bypass: bypass} do
      body = http_response_body(:funding_source, :get)

      Bypass.expect(bypass, fn conn ->
        assert "GET" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} = FundingSource.get("token", "id")
      assert resp.__struct__ == Dwolla.FundingSource
      refute resp.id == nil
      refute resp.created == nil
      refute resp.name == nil
      refute resp.removed == nil
      refute resp.status == nil
      refute resp.type == nil
      refute resp.channels == nil
      refute resp.bank_name == nil
    end

    test "update/3 requests POST and returns Dwolla.FundingSource", %{bypass: bypass} do
      body = http_response_body(:funding_source, :get)

      Bypass.expect(bypass, fn conn ->
        assert "POST" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} = FundingSource.update_name("token", "id", "My Checking")
      assert resp.__struct__ == Dwolla.FundingSource
    end

    test "remove/2 requests POST and returns Dwolla.FundingSource", %{bypass: bypass} do
      body = http_response_body(:funding_source, :get)

      Bypass.expect(bypass, fn conn ->
        assert "POST" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} = FundingSource.remove("token", "id")
      assert resp.__struct__ == Dwolla.FundingSource
    end

    test "balance/2 requests GET and returns Dwolla.FundingSource.Balance", %{bypass: bypass} do
      body = http_response_body(:balance, :get)

      Bypass.expect(bypass, fn conn ->
        assert "GET" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} = FundingSource.balance("token", "id")
      assert resp.__struct__ == Dwolla.FundingSource.Balance
    end

    test "initiate_micro_deposits/3 requests POST and returns an ID",
         %{bypass: bypass} do
      {k, v} = http_response_header(:initiate_micro_deposits)

      Bypass.expect(bypass, fn conn ->
        assert "POST" == conn.method

        conn
        |> Conn.put_resp_header(k, v)
        |> Conn.resp(201, "")
      end)

      assert {:ok, resp} = FundingSource.initiate_micro_deposits("token", "id")
      assert resp == %{id: "37be35e6-664a-452d-aec2-8fb83b728d7f"}
    end

    test "verify_micro_deposits/3 requests POST and returns a link",
         %{bypass: bypass} do
      body = http_response_body(:verify_micro_deposits, :post)

      Bypass.expect(bypass, fn conn ->
        assert "POST" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} =
               FundingSource.verify_micro_deposits(
                 "token",
                 "id",
                 "0.30",
                 "0.90"
               )

      assert resp == %{id: "37be35e6-664a-452d-aec2-8fb83b728d7f"}
    end
  end
end
