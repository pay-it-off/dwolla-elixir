defmodule Dwolla.Address do
  @moduledoc """
  Dwolla Address data structure.
  """

  defstruct address1: nil,
            address2: nil,
            address3: nil,
            city: nil,
            state_province_region: nil,
            postal_code: nil,
            country: nil

  @type t :: %__MODULE__{
          address1: String.t(),
          address2: String.t() | nil,
          address3: String.t() | nil,
          city: String.t(),
          state_province_region: String.t(),
          postal_code: String.t() | nil,
          country: String.t()
        }
end
