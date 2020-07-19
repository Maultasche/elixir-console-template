defmodule ElixirConsoleTemplate.CLI do
  alias ElixirConsoleTemplate.Operations

  @doc """
  Outputs argument validation errors to standard out

  ## Parameters

  - errors: a list of errors to be printed to standard out

  ## Returns

  :ok
  """
  @spec output_arg_validation_errors(list(String.t())) :: :ok
  def output_arg_validation_errors(errors) do
    Enum.each(errors, &IO.puts/1)

    IO.puts("")

    output_usage_info()
  end

  @doc """
  Outputs information to standard out regarding program usage

  ## Returns

  :ok
  """
  @spec output_usage_info() :: :ok
  def output_usage_info() do
    operations =
      Operations.valid_operations()
      |> Enum.join(", ")

    IO.puts("""
    usage: elixir_console_template --operation <operation> <first operand> <second operand>
    operations: #{operations}

    example: elixir_console_template --operation mult 4 5
    """)
  end
end
