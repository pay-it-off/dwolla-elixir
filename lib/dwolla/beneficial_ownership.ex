defmodule Dwolla.BeneficialOwnership do
  @moduledoc """
  Dwolla Beneficial Ownership data structure.
  """

  defstruct status: nil

  @type t :: %__MODULE__{
          status: String.t()
        }
end
