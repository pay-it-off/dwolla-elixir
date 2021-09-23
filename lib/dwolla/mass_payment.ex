defmodule Dwolla.MassPayment do
  @moduledoc """
  Functions for `mass-payments` endpoint.
  """

  alias Dwolla.Utils

  defstruct id: nil,
            created: nil,
            status: nil,
            metadata: nil,
            funding_transfer_id: nil,
            source_funding_source_id: nil,
            correlation_id: nil,
            total: nil,
            total_fees: nil

  @type t :: %__MODULE__{
          id: String.t(),
          created: String.t(),
          # "deferred" | "pending" | "processing" | "complete" |
          status: String.t(),
          metadata: Map.t(),
          funding_transfer_id: String.t(),
          source_funding_source_id: String.t(),
          correlation_id: String.t(),
          total: Dwolla.Amount.t(),
          total_fees: Dwolla.Amount.t()
        }

  @type token :: String.t()
  @type id :: String.t()
  @type params :: %{required(atom) => any}
  @type error :: HTTPoison.Error.t() | Dwolla.Errors.t() | tuple
  @type location :: %{id: String.t()}

  @endpoint "mass-payments"

  defmodule Item do
    @moduledoc """
    Dwolla Mass Payment Item data structure
    """
    defstruct id: nil,
              dest_resource: nil,
              dest_resource_id: nil,
              amount: nil,
              metadata: nil,
              status: nil,
              errors: nil,
              transfer_id: nil

    @type t :: %__MODULE__{
            id: String.t(),
            dest_resource: String.t(),
            dest_resource_id: String.t(),
            amount: Dwolla.Amount.t(),
            metadata: Map.t(),
            status: String.t(),
            # "failed" | "pending" | "success"
            errors: Dwolla.Errors.t(),
            transfer_id: String.t()
          }
  end

  @doc """
  Initiates a mass payment.

  The parameters are verbose because of the many options available to the user
  for setting the source and destination of the funds in the `href` field.

  Parameters
  ```
  %{
      _links: %{
        source: %{
          href: "https://api-uat.dwolla.com/funding-sources/..."
        }
      },
      items: [
        %{
          _links: %{
            destination: %{
              href: "https://api-uat.dwolla.com/funding-sources/..."
            }
          },
          amount: %{
            value: 1.00,
            currency: "USD"
          }
        }
      ],
      correlation_id: "3e17e4ad-4136-2fd3-a45d-adaa015d494c"
    }
  ```
  """
  @spec initiate(token, params, any) :: {:ok, location} | {:error, error}
  def initiate(token, params, idempotency_key) do
    headers = Utils.idempotency_header(idempotency_key)

    Dwolla.make_request_with_token(:post, @endpoint, token, params, headers)
    |> Utils.handle_resp(:mass_payment)
  end

  @doc """
  Gets a mass payment by id.
  """
  @spec get(token, id) :: {:ok, Dwolla.MassPayment.t()} | {:error, error}
  def get(token, id) do
    endpoint = @endpoint <> "/#{id}"

    Dwolla.make_request_with_token(:get, endpoint, token)
    |> Utils.handle_resp(:mass_payment)
  end

  @doc """
  Gets items in a mass payment by id. Results paginated.

  Parameters
  ```
  %{limit: 25, offset: 0, status: "pending"}
  ```
  """
  @spec get_items(token, id, params) :: {:ok, [Dwolla.MassPayment.Item.t()]} | {:error, error}
  def get_items(token, id, params \\ %{}) do
    endpoint =
      case Map.keys(params) do
        [] -> @endpoint <> "/#{id}/items"
        _ -> @endpoint <> "/#{id}/items?" <> Utils.encode_params(params)
      end

    Dwolla.make_request_with_token(:get, endpoint, token)
    |> Utils.handle_resp(:mass_payment_items)
  end
end
