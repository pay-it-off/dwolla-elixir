defmodule Dwolla.BusinessClassification do
  @moduledoc """
  Functions for `business-classifications` endpoint.
  """

  alias Dwolla.Utils

  defstruct id: nil, name: nil, industry_classifications: []

  defmodule IndustryClassification do
    @moduledoc """
    The `industry-classifications` type embedded in `business-classifications`.
    """

    @type t :: %__MODULE__{
            id: String.t(),
            name: String.t()
          }
    defstruct id: nil, name: nil
  end

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          industry_classifications: [IndustryClassification.t()]
        }
  @type token :: String.t()
  @type id :: String.t()
  @type error :: HTTPoison.Error.t() | Dwolla.Errors.t() | atom() | tuple()

  @endpoint "business-classifications"

  @doc """
  List all industry-classifications by business-classifications.
  """
  @spec list(token()) :: {:ok, [t()]} | {:error, error()}
  def list(token) do
    Dwolla.make_request_with_token(:get, @endpoint, token)
    |> Utils.handle_resp(:business_classification)
  end

  @doc """
  Gets a business-classification by id.
  """
  @spec get(token(), id()) :: {:ok, t()} | {:error, error()}
  def get(token, id) do
    endpoint = @endpoint <> "/#{id}"

    Dwolla.make_request_with_token(:get, endpoint, token)
    |> Utils.handle_resp(:business_classification)
  end
end
