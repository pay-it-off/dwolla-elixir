defmodule Dwolla.Amount do
  @moduledoc """
  Dwolla Amount data structure.
  """

  defstruct value: nil, currency: nil
  @type t :: %__MODULE__{value: String.t(), currency: String.t()}
end
