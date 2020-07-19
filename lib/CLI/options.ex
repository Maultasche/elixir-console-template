defmodule ElixirConsoleTemplate.CLI.Options do
  @moduledoc """
  Represents a set of command line options
  """
  defstruct operation: "",
            operands: []

  # Define the stuct type definition
  @type t :: %ElixirConsoleTemplate.CLI.Options{
          operation: String.t() | nil,
          operands: list(number())
        }

  @spec new(String.t(), list(number())) :: ElixirConsoleTemplate.CLI.Options.t()
  def new(operation, operands) do
    %ElixirConsoleTemplate.CLI.Options{
      operation: operation,
      operands: operands
    }
  end
end
