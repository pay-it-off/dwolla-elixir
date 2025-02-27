defmodule Dwolla.Factory do
  @moduledoc false

  def http_response_body(:token) do
    %{
      access_token: "0l6Vijvre4ICDV9SltG3KbekbtrGOPoQcP5XITsEKWH5L5me0S",
      token_type: "bearer",
      expires_in: 3601
    }
  end

  def http_response_body(:error) do
    %{
      code: "ValidationError",
      message: "Validation error(s) present. See embedded errors list for more details.",
      _embedded: %{
        errors: [
          %{
            code: "Required",
            message: "FirstName is required.",
            path: "/firstName"
          }
        ]
      }
    }
  end

  def http_response_body(:customer, :update) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/customers/b2cf497a-b315-497e-95b7-d1238288f8cb\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"receive\":{\"href\":\"https://api-sandbox.dwolla.com/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"edit-form\":{\"href\":\"https://api-sandbox.dwolla.com/customers/b2cf497a-b315-497e-95b7-d1238288f8cb\",\"type\":\"application/vnd.dwolla.v1.hal+json; profile=\\\"https://github.com/dwolla/hal-forms\\\"\",\"resource-type\":\"customer\"},\"edit\":{\"href\":\"https://api-sandbox.dwolla.com/customers/b2cf497a-b315-497e-95b7-d1238288f8cb\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"funding-sources\":{\"href\":\"https://api-sandbox.dwolla.com/customers/b2cf497a-b315-497e-95b7-d1238288f8cb/funding-sources\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"transfers\":{\"href\":\"https://api-sandbox.dwolla.com/customers/b2cf497a-b315-497e-95b7-d1238288f8cb/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"send\":{\"href\":\"https://api-sandbox.dwolla.com/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"}},\"id\":\"b2cf497a-b315-497e-95b7-d1238288f8cb\",\"firstName\":\"Will\",\"lastName\":\"Gilman\",\"email\":\"will@example.com\",\"type\":\"personal\",\"status\":\"verified\",\"created\":\"2017-03-15T20:46:33.330Z\",\"address1\":\"2340 Chicago St\",\"address2\":\"Apt 3\",\"city\":\"Bodega Bay\",\"state\":\"CA\",\"postalCode\":\"94923\",\"phone\":\"0987654321\"}"
  end

  def http_response_body(:customer, :suspend) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/customers/e5101b1f-f582-4162-b0bd-c2c464f4e741\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"}},\"id\":\"e5101b1f-f582-4162-b0bd-c2c464f4e741\",\"firstName\":\"Bob\",\"lastName\":\"Costco\",\"email\":\"bob@costco.com\",\"type\":\"unverified\",\"status\":\"suspended\",\"created\":\"2016-10-10T20:31:59.820Z\"}"
  end

  def http_response_body(:customer, :get) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"receive\":{\"href\":\"https://api-sandbox.dwolla.com/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"edit-form\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json; profile=\\\"https://github.com/dwolla/hal-forms\\\"\",\"resource-type\":\"customer\"},\"edit\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"funding-sources\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44/funding-sources\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"transfers\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"send\":{\"href\":\"https://api-sandbox.dwolla.com/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"}},\"id\":\"a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"firstName\":\"Ben\",\"lastName\":\"Franklin\",\"email\":\"ben.franklin@usaog.com\",\"type\":\"personal\",\"status\":\"verified\",\"created\":\"2016-10-10T21:12:03.577Z\",\"address1\":\"99-99 33rd St\",\"city\":\"some city\",\"state\":\"NY\",\"postalCode\":\"11101\",\"phone\":\"8008881776\"}"
  end

  def http_response_body(:customer, :search) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/customers?search=ben.franklin@usaog.com\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"first\":{\"href\":\"https://api-sandbox.dwolla.com/customers?search=ben.franklin@usaog.com&limit=25&offset=0\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"last\":{\"href\":\"https://api-sandbox.dwolla.com/customers?search=ben.franklin@usaog.com&limit=25&offset=0\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"}},\"_embedded\":{\"customers\":[{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"receive\":{\"href\":\"https://api-sandbox.dwolla.com/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"edit-form\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json; profile=\\\"https://github.com/dwolla/hal-forms\\\"\",\"resource-type\":\"customer\"},\"edit\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"funding-sources\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44/funding-sources\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"transfers\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"send\":{\"href\":\"https://api-sandbox.dwolla.com/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"}},\"id\":\"a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"firstName\":\"Ben\",\"lastName\":\"Franklin\",\"email\":\"ben.franklin@usaog.com\",\"type\":\"personal\",\"status\":\"verified\",\"created\":\"2016-10-10T21:12:03.577Z\",\"address1\":\"99-99 33rd St\",\"city\":\"some city\",\"state\":\"NY\",\"postalCode\":\"11101\",\"phone\":\"8008881776\"}]},\"total\":1}"
  end

  def http_response_body(:funding_source, :list) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44/funding-sources\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"customer\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"}},\"_embedded\":{\"funding-sources\":[{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/53720cfa-1088-4aee-8fd6-d98e4617732f\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"customer\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"initiate-micro-deposits\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/53720cfa-1088-4aee-8fd6-d98e4617732f/micro-deposits\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"micro-deposits\"}},\"id\":\"53720cfa-1088-4aee-8fd6-d98e4617732f\",\"status\":\"unverified\",\"type\":\"bank\",\"name\":\"My name 7\",\"created\":\"2016-11-07T03:39:46.000Z\",\"removed\":false,\"channels\":[\"ach\"],\"bankName\":\"SANDBOX TEST BANK\"},{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/e8b4d511-805d-4e91-bfb4-670cd9583a18\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"customer\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"initiate-micro-deposits\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/e8b4d511-805d-4e91-bfb4-670cd9583a18/micro-deposits\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"micro-deposits\"}},\"id\":\"e8b4d511-805d-4e91-bfb4-670cd9583a18\",\"status\":\"unverified\",\"type\":\"bank\",\"name\":\"Big Ben's Checking Account\",\"created\":\"2017-03-15T22:27:51.000Z\",\"removed\":false,\"channels\":[\"ach\"],\"bankName\":\"SANDBOX TEST BANK\"},{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/f049fbc5-7162-474a-b30a-85cd8e90fbd0\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"customer\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"initiate-micro-deposits\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/f049fbc5-7162-474a-b30a-85cd8e90fbd0/micro-deposits\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"micro-deposits\"}},\"id\":\"f049fbc5-7162-474a-b30a-85cd8e90fbd0\",\"status\":\"unverified\",\"type\":\"bank\",\"name\":\"My Balance\",\"created\":\"2016-10-10T21:15:27.000Z\",\"removed\":true,\"channels\":[\"ach\"]},{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/2c824e50-1c23-4adc-8935-9d1fa1bb21a4\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"customer\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"with-available-balance\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/2c824e50-1c23-4adc-8935-9d1fa1bb21a4\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"balance\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/2c824e50-1c23-4adc-8935-9d1fa1bb21a4/balance\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"balance\"}},\"id\":\"2c824e50-1c23-4adc-8935-9d1fa1bb21a4\",\"status\":\"verified\",\"type\":\"balance\",\"name\":\"Balance\",\"created\":\"2016-10-10T21:12:09.000Z\",\"removed\":false,\"channels\":[]}]}}"
  end

  def http_response_body(:transfer, :search) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44/transfers\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"first\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44/transfers?&limit=25&offset=0\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"last\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44/transfers?&limit=25&offset=0\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"}},\"_embedded\":{\"transfers\":[]},\"total\":0}"
  end

  def http_response_body(:funding_source, :get) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/f049fbc5-7162-474a-b30a-85cd8e90fbd0\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"customer\":{\"href\":\"https://api-sandbox.dwolla.com/customers/a131acb0-9fad-4fe6-9ccd-3a5c4facaf44\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"},\"initiate-micro-deposits\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/f049fbc5-7162-474a-b30a-85cd8e90fbd0/micro-deposits\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"micro-deposits\"}},\"id\":\"f049fbc5-7162-474a-b30a-85cd8e90fbd0\",\"status\":\"unverified\",\"type\":\"bank\",\"name\":\"My Balance\",\"created\":\"2016-10-10T21:15:27.000Z\",\"removed\":true,\"channels\":[\"ach\"],\"bankName\":\"SANDBOX TEST BANK\"}"
  end

  def http_response_body(:balance, :get) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/c18945d3-101e-4aee-8eb4-f33887222935/balance\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"balance\"},\"funding-source\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/c18945d3-101e-4aee-8eb4-f33887222935\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"}},\"balance\":{\"value\":\"0.00\",\"currency\":\"USD\"},\"lastUpdated\":\"2017-04-03T21:41:10.283Z\"}"
  end

  def http_response_body(:verify_micro_deposits, :post) do
    "{\"_links\": {\"self\": {\"href\": \"https://api-sandbox.dwolla.com/funding-sources/37be35e6-664a-452d-aec2-8fb83b728d7f/micro-deposits\", \"resource-type\": \"micro-deposits\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}}}"
  end

  def http_response_body(:transfer, :get) do
    "{\"_links\":{\"cancel\":{\"href\":\"https://api-sandbox.dwolla.com/transfers/8f669079-b036-e611-80e3-0aa34a9b2388\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"source\":{\"href\":\"https://api-sandbox.dwolla.com/accounts/fc81fee0-1520-4949-bc2d-73e4e11fddd9\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"account\"},\"funding-transfer\":{\"href\":\"https://api-sandbox.dwolla.com/transfers/8e669079-b036-e611-80e3-0aa34a9b2388\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"self\":{\"href\":\"https://api-sandbox.dwolla.com/transfers/8f669079-b036-e611-80e3-0aa34a9b2388\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"transfer\"},\"source-funding-source\":{\"href\":\"https://api-sandbox.dwolla.com/funding-sources/70c99528-285d-4de5-9ece-6d9b8f5cb1a4\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"funding-source\"},\"destination\":{\"href\":\"https://api-sandbox.dwolla.com/customers/df1eb2aa-3d75-48a1-b882-425b579a85dc\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"customer\"}},\"id\":\"8f669079-b036-e611-80e3-0aa34a9b2388\",\"status\":\"pending\",\"amount\":{\"value\":\"55.00\",\"currency\":\"usd\"},\"created\":\"2016-06-20T06:30:27.243Z\",\"metadata\":{\"notes\":\"First test transfer!\",\"customerId\":\"1234\"}}"
  end

  def http_response_body(:transfer, :failure) do
    "{\"_links\": {\"self\": {\"href\": \"https://api-sandbox.dwolla.com/transfers/E6D9A950-AC9E-E511-80DC-0AA34A9B2388/failure\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"failure\"}},\"code\":\"R1\",\"description\":\"Insufficient Funds\"}"
  end

  def http_response_body(:mass_payment, :get) do
    "{\"_links\": {\"funding-transfer\": {\"href\": \"https://api-sandbox.dwolla.com/transfers/f24b8135-e21b-ec11-8138-fd945f81a1fa\", \"resource-type\": \"transfer\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}, \"items\": {\"href\": \"https://api-sandbox.dwolla.com/mass-payments/4f4edcdc-49c2-41ca-a71c-adab014e98b9/items\", \"resource-type\": \"mass-payment-item\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}, \"self\": {\"href\": \"https://api-sandbox.dwolla.com/mass-payments/4f4edcdc-49c2-41ca-a71c-adab014e98b9\", \"resource-type\": \"mass-payment\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}, \"source\": {\"href\": \"https://api-sandbox.dwolla.com/funding-sources/e7bd5db2-f290-47c8-a3e1-c976af9146d7\", \"resource-type\": \"funding-source\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}}, \"correlationId\": \"3e17e4ad-4136-2fd3-a45d-adaa015d494c\", \"created\": \"2021-09-22T20:18:17.000Z\", \"id\": \"4f4edcdc-49c2-41ca-a71c-adab014e98b9\", \"metadata\": {\"batch1\": \"batch1\"}, \"status\": \"complete\", \"total\": {\"currency\": \"USD\", \"value\": \"1.00\"}, \"totalFees\": {\"currency\": \"USD\", \"value\": \"0.00\"}}"
  end

  def http_response_body(:mass_payment_items, :get) do
    "{\"_embedded\": {\"items\": [{\"_embedded\": {\"errors\": [{\"_links\": {}, \"code\": \"Invalid\", \"message\": \"Receiver cannot be the owner of the source funding source.\", \"path\": \"/items/destination/href\"}]}, \"_links\": {\"destination\": {\"href\": \"https://api-sandbox.dwolla.com/accounts/b010e278-3831-4d09-91b0-067e6c56da72\", \"resource-type\": \"account\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}, \"mass-payment\": {\"href\": \"https://api-sandbox.dwolla.com/mass-payments/4f4edcdc-49c2-41ca-a71c-adab014e98b9\", \"resource-type\": \"mass-payment\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}, \"self\": {\"href\": \"https://api-sandbox.dwolla.com/mass-payment-items/61bfea12-79ba-4aeb-9a9b-4d199b48de2b\", \"resource-type\": \"mass-payment-item\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}}, \"amount\": {\"currency\": \"USD\", \"value\": \"1.00\"}, \"created\": \"2021-09-22T20:18:17.000Z\", \"id\": \"61bfea12-79ba-4aeb-9a9b-4d199b48de2b\", \"metadata\": {\"batch1\": \"batch1\"}, \"status\": \"failed\"}]}, \"_links\": {\"first\": {\"href\": \"https://api-sandbox.dwolla.com/mass-payments/4f4edcdc-49c2-41ca-a71c-adab014e98b9/items?&limit=25&offset=0\", \"resource-type\": \"mass-payment-item\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}, \"last\": {\"href\": \"https://api-sandbox.dwolla.com/mass-payments/4f4edcdc-49c2-41ca-a71c-adab014e98b9/items?&limit=25&offset=0\", \"resource-type\": \"mass-payment-item\",\"type\": \"application/vnd.dwolla.v1.hal+json\"}, \"self\": {\"href\": \"https://api-sandbox.dwolla.com/mass-payments/4f4edcdc-49c2-41ca-a71c-adab014e98b9/items\", \"resource-type\": \"mass-payment-item\", \"type\": \"application/vnd.dwolla.v1.hal+json\"}}, \"total\": 1}"
  end

  def http_response_body(:event, :list) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/events\"},\"first\":{\"href\":\"https://api-sandbox.dwolla.com/events?limit=25&offset=0\"},\"last\":{\"href\":\"https://api-sandbox.dwolla.com/events?limit=25&offset=150\"},\"next\":{\"href\":\"https://api-sandbox.dwolla.com/events?limit=25&offset=25\"}},\"_embedded\":{\"events\":[{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/events/78e57644-56e4-4da2-b743-059479f2e80f\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"event\"},\"resource\":{\"href\":\"https://api-sandbox.dwolla.com/transfers/47CFDDB4-1E74-E511-80DB-0AA34A9B2388\"},\"account\":{\"href\":\"https://api-sandbox.dwolla.com/accounts/ca32853c-48fa-40be-ae75-77b37504581b\"}},\"id\":\"78e57644-56e4-4da2-b743-059479f2e80f\",\"created\":\"2015-10-16T15:58:18.000Z\",\"topic\":\"bank_transfer_created\",\"resourceId\":\"47CFDDB4-1E74-E511-80DB-0AA34A9B2388\"},{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/events/f8e70f48-b7ff-47d0-9d3d-62a099363a76\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"event\"},\"resource\":{\"href\":\"https://api-sandbox.dwolla.com/transfers/48CFDDB4-1E74-E511-80DB-0AA34A9B2388\"},\"account\":{\"href\":\"https://api-sandbox.dwolla.com/accounts/ca32853c-48fa-40be-ae75-77b37504581b\"}},\"id\":\"f8e70f48-b7ff-47d0-9d3d-62a099363a76\",\"created\":\"2015-10-16T15:58:15.000Z\",\"topic\":\"transfer_created\",\"resourceId\":\"48CFDDB4-1E74-E511-80DB-0AA34A9B2388\"}]},\"total\": 2}"
  end

  def http_response_body(:event, :get) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/events/81f6e13c-557c-4449-9331-da5c65e61095\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"event\"},\"resource\":{\"href\":\"https://api-sandbox.dwolla.com/transfers/09A166BC-1B74-E511-80DB-0AA34A9B2388\"},\"account\":{\"href\":\"https://api-sandbox.dwolla.com/accounts/ca32853c-48fa-40be-ae75-77b37504581b\"},\"customer\":{\"href\":\"https://api-sandbox.dwolla.com/customers/07d59716-ef22-4fe6-98e8-f3190233dfb8\"}},\"id\":\"81f6e13c-557c-4449-9331-da5c65e61095\",\"created\":\"2015-10-16T15:37:02.000Z\",\"topic\":\"customer_transfer_created\",\"resourceId\":\"09A166BC-1B74-E511-80DB-0AA34A9B2388\"}"
  end

  def http_response_body(:webhook_subscription, :get) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/webhook-subscriptions/4c63f8c2-6599-4e7d-9594-be5e0c25a8c7\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"webhook-subscription\"},\"webhooks\":{\"href\":\"https://api-sandbox.dwolla.com/webhook-subscriptions/4c63f8c2-6599-4e7d-9594-be5e0c25a8c7/webhooks\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"webhook\"}},\"id\":\"4c63f8c2-6599-4e7d-9594-be5e0c25a8c7\",\"url\":\"https://twopence.co/api/dwolla\",\"paused\":false,\"created\":\"2017-03-16T17:12:41.000Z\"}"
  end

  def http_response_body(:webhook_subscription, :list) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/webhook-subscriptions\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"webhook-subscription\"}},\"_embedded\":{\"webhook-subscriptions\":[{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/webhook-subscriptions/d2b4f94a-e0bf-4ef0-9285-a08efe023a4e\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"webhook-subscription\"},\"webhooks\":{\"href\":\"https://api-sandbox.dwolla.com/webhook-subscriptions/d2b4f94a-e0bf-4ef0-9285-a08efe023a4e/webhooks\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"webhook\"}},\"id\":\"d2b4f94a-e0bf-4ef0-9285-a08efe023a4e\",\"url\":\"https://twopence.co/api/dwolla\",\"paused\":false,\"created\":\"2017-03-16T17:26:48.000Z\"}]},\"total\":1}"
  end

  def http_response_body(:webhook, :get) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/webhooks/9ece9660-aa34-41eb-80d7-0125d53b45e8\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"webhook\"},\"subscription\":{\"href\":\"https://api-sandbox.dwolla.com/webhook-subscriptions/a0943041-7a5c-4e8f-92de-b55711ef3a83\"},\"retry\":{\"href\":\"https://api-sandbox.dwolla.com/webhooks/9ece9660-aa34-41eb-80d7-0125d53b45e8/retries\"},\"event\":{\"href\":\"https://api-sandbox.dwolla.com/events/03c7e14c-7f15-44a2-bcf7-83f2f7e95d50\"}},\"id\":\"9ece9660-aa34-41eb-80d7-0125d53b45e8\",\"topic\":\"transfer_created\",\"accountId\":\"ca32853c-48fa-40be-ae75-77b37504581b\",\"eventId\":\"03c7e14c-7f15-44a2-bcf7-83f2f7e95d50\",\"subscriptionId\":\"a0943041-7a5c-4e8f-92de-b55711ef3a83\",\"attempts\":[{\"id\":\"d4d16621-c6b0-40cb-8dc3-0469fa9dc4e8\",\"request\":{\"timestamp\":\"2015-10-27T17:07:34.304Z\",\"url\":\"https://myapp.runscope.net\",\"headers\":[{\"name\":\"X-Dwolla-Topic\",\"value\":\"transfer_created\"},{\"name\":\"X-Request-Signature\",\"value\":\"bd93780bd7e1ad77ab821094aaa0f9e3dece5ee3\"}],\"body\":{\"id\":\"03c7e14c-7f15-44a2-bcf7-83f2f7e95d50\",\"resourceId\":\"81BA6F36-CD7C-E511-80DB-0AA34A9B2388\",\"topic\":\"transfer_created\",\"timestamp\":\"2015-10-27T17:07:34.207Z\",\"_links\":{\"self\":{\"href\":\"https://api.dwolla.com/events/03c7e14c-7f15-44a2-bcf7-83f2f7e95d50\"},\"account\":{\"href\":\"https://api-sandbox.dwolla.com/accounts/ca32853c-48fa-40be-ae75-77b37504581b\"},\"resource\":{\"href\":\"https://api.dwolla.com/transfers/81BA6F36-CD7C-E511-80DB-0AA34A9B2388\"}}}},\"response\":{\"timestamp\":\"2015-10-27T17:07:34.308Z\",\"headers\":[{\"name\":\"Date\",\"value\":\"Tue,27Oct201517:07:34GMT\"},{\"name\":\"Content-Type\",\"value\":\"application/json;charset=UTF-8\"},{\"name\":\"Content-Length\",\"value\":\"1093\"},{\"name\":\"Connection\",\"value\":\"keep-alive\"},{\"name\":\"Access-Control-Allow-Credentials\",\"value\":\"true\"},{\"name\":\"Access-Control-Allow-Methods\",\"value\":\"GET,PUT,POST,PATCH,DELETE,OPTIONS,HEAD\"},{\"name\":\"Server\",\"value\":\"Runscope-Gateway/1.0\"},{\"name\":\"Runscope-Message-Id\",\"value\":\"97aa5bbd-784f-4007-80cc-8f56919000a0\"},{\"name\":\"Access-Control-Allow-Origin\",\"value\":\"*\"}],\"statusCode\":200,\"body\":{}}}]}"
  end

  def http_response_body(:webhook, :retries) do
    "{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/webhooks/9ece9660-aa34-41eb-80d7-0125d53b45e8/retries\"}},\"_embedded\":{\"retries\":[{\"_links\":{\"self\":{\"href\":\"https://api-sandbox.dwolla.com/webhooks/9ece9660-aa34-41eb-80d7-0125d53b45e8/retries/5aa27a0f-cf99-418d-a3ee-67c0ff99a494\",\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"retries\"},\"webhook\":{\"href\":\"https://api.dwolla.com/webhooks/9ece9660-aa34-41eb-80d7-0125d53b45e8\"}},\"id\":\"5aa27a0f-cf99-418d-a3ee-67c0ff99a494\",\"timestamp\":\"2015-11-02T17:43:26.000Z\"}]},\"total\":1}"
  end

  def http_response_body(:bill_payment, :get) do
    "{\"correlationId\":\"9ece9660-aa34-41eb-80d7-0125d53b45e8\",\"status\":\"pending\",\"id\":\"55bdfc3a-9568-4a67-92b3-867fde741a46\",\"created\":\"2018-03-29T17:43:35.692Z\",\"billedFor\":\"Biller Name\",\"_links\":{\"type\":\"application/vnd.dwolla.v1.hal+json\",\"transfers\":{\"href\":\"https://api-sandbox.dwolla.com/transfers/fd561bb4-7833-e811-8106-0a595ef38714\"},\"self\":{\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"bill-payment\",\"href\":\"https://api-sandbox.dwolla.com/bill-payments/55bdfc3a-9568-4a67-92b3-867fde741a46\"},\"resource-type\":\"transfer\"}}"
  end

  def http_response_body(:business_classification, :list) do
    "{\"total\":1,\"_links\":{},\"_embedded\":{\"business-classifications\":[#{http_response_body(:business_classification, :get)}]}}"
  end

  def http_response_body(:business_classification, :get) do
    "{\"name\":\"Food retail and service\",\"id\":\"9ed3f669-7d6f-11e3-b545-5404a6144203\",\"_links\":{\"self\":{\"type\":\"application/vnd.dwolla.v1.hal+json\",\"resource-type\":\"business-classification\",\"href\":\"https://api-sandbox.dwolla.com/business-classifications/9ed3f669-7d6f-11e3-b545-5404a6144203\"}},\"_embedded\":{\"industry-classifications\":[{\"name\":\"Gourmet foods\",\"id\":\"9ed3f671-7d6f-11e3-803c-5404a6144203\"},{\"name\":\"Distilleries\",\"id\":\"9ed3f66c-7d6f-11e3-86ae-5404a6144203\"},{\"name\":\"Breweries\",\"id\":\"9ed3f66a-7d6f-11e3-8acd-5404a6144203\"},{\"name\":\"Alcoholic beverage drinking places\",\"id\":\"9ed3f66d-7d6f-11e3-9101-5404a6144203\"},{\"name\":\"Beer, wine, and liquor store\",\"id\":\"9ed3f66e-7d6f-11e3-9480-5404a6144203\"},{\"name\":\"Wineries\",\"id\":\"9ed3f66b-7d6f-11e3-95ac-5404a6144203\"},{\"name\":\"Tobacco\",\"id\":\"9ed3f674-7d6f-11e3-9619-5404a6144203\"},{\"name\":\"Restaurant\",\"id\":\"9ed3f673-7d6f-11e3-adb1-5404a6144203\"},{\"name\":\"Supplement store\",\"id\":\"9ed3f676-7d6f-11e3-af8e-5404a6144203\"},{\"name\":\"Pharmacy and drugstore\",\"id\":\"9ed3f675-7d6f-11e3-afad-5404a6144203\"},{\"name\":\"Coffee and tea\",\"id\":\"9ed3f670-7d6f-11e3-b1ce-5404a6144203\"},{\"name\":\"Catering services\",\"id\":\"9ed3f66f-7d6f-11e3-b1df-5404a6144203\"},{\"name\":\"Specialty and miscellaneous food store\",\"id\":\"9ed3f672-7d6f-11e3-b67a-5404a6144203\"}]}}"
  end

  def http_response_header(:customer) do
    {"Location", "https://api-sandbox.dwolla.com/customers/b2cf497a-b315-497e-95b7-d1238288f8cb"}
  end

  def http_response_header(:funding_source) do
    {"Location",
     "https://api-sandbox.dwolla.com/funding-sources/e8b4d511-805d-4e91-bfb4-670cd9583a18"}
  end

  def http_response_header(:transfer) do
    {"Location", "https://api-sandbox.dwolla.com/transfers/494b6269-d909-e711-80ee-0aa34a9b2388"}
  end

  def http_response_header(:mass_payment) do
    {"Location",
     "https://api-sandbox.dwolla.com/mass-payments/4f4edcdc-49c2-41ca-a71c-adab014e98b9"}
  end

  def http_response_header(:webhook_subscription) do
    {"Location",
     "https://api-sandbox.dwolla.com/webhook-subscriptions/d2b4f94a-e0bf-4ef0-9285-a08efe023a4e"}
  end

  def http_response_header(:webhook) do
    {"Location",
     "https://api-sandbox.dwolla.com/webhooks/9ece9660-aa34-41eb-80d7-0125d53b45e8/retries/5aa27a0f-cf99-418d-a3ee-67c0ff99a494"}
  end

  def http_response_header(:initiate_micro_deposits) do
    {"Location",
     "https://api-sandbox.dwolla.com/funding-sources/37be35e6-664a-452d-aec2-8fb83b728d7f/micro-deposits"}
  end
end
