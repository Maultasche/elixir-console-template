defmodule ElixirConsoleTemplate do
  alias ElixirConsoleTemplate.CLI
  alias ElixirConsoleTemplate.Operations

  @operation_functions %{
    add: &Operations.add/2,
    subtract: &Operations.subtract/2,
    multiply: &Operations.multiply/2,
    divide: &Operations.divide/2
  }

  @moduledoc """
  Documentation for `ElixirConsoleTemplate`.
  """

  # This is the main entry point to the application
  @spec main(list(String.t())) :: :ok
  def main(argv) do
    argv
    |> CLI.Args.parse()
    |> CLI.Args.validate()
    |> process()
  end

  @spec process(CLI.Args.validation_results()) :: :ok
  def process({:ok, :help}) do
    CLI.output_usage_info()
  end

  def process({:error, errors}) do
    CLI.output_arg_validation_errors(errors)
  end

  def process({:ok, %CLI.Options{operation: operation, operands: operands}}) do
    # Select the operations function based on the operation in the command line options
    operation_func = @operation_functions[operation]

    # Apply the operation
    result = apply(operation_func, operands)

    # Output the result
    CLI.output_result(result)
  end
end
