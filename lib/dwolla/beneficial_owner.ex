defmodule Dwolla.BeneficialOwner do
  @moduledoc """
  Functions for `beneficial-owners` endpoint.
  """

  alias Dwolla.Utils

  defstruct id: nil,
            first_name: nil,
            last_name: nil,
            date_of_birth: nil,
            address: nil,
            verification_status: nil

  @type t :: %__MODULE__{
          id: String.t(),
          first_name: String.t(),
          last_name: String.t(),
          date_of_birth: String.t(),
          address: map(),
          # "document" | "incomplete" | "verified"
          verification_status: nil
        }
  @type token :: String.t()
  @type id :: String.t()
  @type error :: HTTPoison.Error.t() | Dwolla.Errors.t() | tuple()

  @endpoint "beneficial-owners"

  @doc """
  Gets a beneficial owner by id.
  """
  @spec get(token, id) :: {:ok, Dwolla.FundingSource.t()} | {:error, error}
  def get(token, id) do
    endpoint = @endpoint <> "/#{id}"

    Dwolla.make_request_with_token(:get, endpoint, token)
    |> Utils.handle_resp(:beneficial_owner)
  end

  @doc """
  Updates a beneficial owner.
  """
  @spec update(token, id, map()) ::
          {:ok, Dwolla.BeneficialOwner.t()} | {:error, error}
  def update(token, id, params) do
    endpoint = @endpoint <> "/#{id}"

    Dwolla.make_request_with_token(:post, endpoint, token, params)
    |> Utils.handle_resp(:beneficial_owner)
  end

  @doc """
  Removes a beneficial owner.
  """
  @spec remove(token, id) :: {:ok, Dwolla.BeneficialOwner.t()} | {:error, error}
  def remove(token, id) do
    endpoint = @endpoint <> "/#{id}"

    Dwolla.make_request_with_token(:delete, endpoint, token)
    |> Utils.handle_resp(:beneficial_owner)
  end
end
