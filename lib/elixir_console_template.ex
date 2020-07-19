defmodule ElixirConsoleTemplate do
  alias ElixirConsoleTemplate.CLI

  @operation_functions %{}

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
    IO.puts("Success!")
  end
end
