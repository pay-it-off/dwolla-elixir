defmodule Dwolla.BusinessClassificationTest do
  use ExUnit.Case

  import Dwolla.Factory

  alias Dwolla.BusinessClassification
  alias Plug.Conn

  setup do
    bypass = Bypass.open()
    Application.put_env(:dwolla, :root_uri, "http://localhost:#{bypass.port}/")
    {:ok, bypass: bypass}
  end

  describe "business classification" do
    test "list/0 GET all Dwolla.BusinessClassifications", %{bypass: bypass} do
      body = http_response_body(:business_classification, :list)

      Bypass.expect(bypass, fn conn ->
        assert "GET" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} = BusinessClassification.list("token")
      assert [%Dwolla.BusinessClassification{} | _rest] = resp
    end

    test "get/2 GET one Dwolla.BusinessClassification", %{bypass: bypass} do
      body = http_response_body(:business_classification, :get)

      Bypass.expect(bypass, fn conn ->
        assert "GET" == conn.method
        Conn.resp(conn, 200, body)
      end)

      assert {:ok, resp} = BusinessClassification.get("token", "id")
      assert %BusinessClassification{} = resp
      assert is_binary(resp.id)
      assert is_binary(resp.name)
      assert is_list(resp.industry_classifications)

      Enum.each(resp.industry_classifications, fn i ->
        assert %BusinessClassification.IndustryClassification{} = i
        assert is_binary(i.id)
        assert is_binary(i.name)
      end)
    end
  end
end
