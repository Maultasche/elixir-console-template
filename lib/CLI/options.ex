defmodule ElixirConsoleTemplate.CLI.Options do
  @moduledoc """
  Represents a set of command line options
  """
  defstruct operation: nil,
    operands: []


  @type operation() :: atom() | String.t() | nil
  # Define the stuct type definition
  @type t :: %ElixirConsoleTemplate.CLI.Options{
          operation: operation(),
          operands: list(number())
        }

  @spec new(operation(), list(number())) :: ElixirConsoleTemplate.CLI.Options.t()
  def new(operation, operands) do
    %ElixirConsoleTemplate.CLI.Options{
      operation: operation,
      operands: operands
    }
  end
end
