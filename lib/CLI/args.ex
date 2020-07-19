defmodule ElixirConsoleTemplate.CLI.Args do
  alias ElixirConsoleTemplate.Operations
  alias ElixirConsoleTemplate.CLI.Options

  @type parsed_switches() :: keyword()
  @type parsed_additional_args() :: list(String.t())
  @type parsed_args() :: {parsed_switches(), parsed_additional_args(), list()}
  @type parse_results :: {:ok, Options.t() | :help}
  @type validation_results() :: parse_results() | {:error, errors()}
  @type errors() :: list(atom())

  @valid_operations Operations.valid_operations()

  @spec parse(list(String.t())) :: parse_results()
  def parse(argv) do
    OptionParser.parse(argv,
      strict: [help: :boolean, operation: :string],
      aliases: [h: :help, o: :operation]
    )
    |> (fn {parsed_args, additional_args, _} -> {parsed_args, additional_args} end).()
    |> args_to_options()
  end

  @spec validate(parse_results()) :: validation_results()
  def validate(parse_result = {:ok, :help}) do
    parse_result
  end

  def validate({:ok, options}) do
    []
    |> validate_operation(options.operation)
    |> validate_operands(options.operands)
    |> validation_result(options)
  end

  @spec validate_operation(list(String.t()), String.t()) :: list(String.t())
  defp validate_operation(errors, operation) when operation in @valid_operations() do
    errors
  end

  defp validate_operation(errors, nil) do
    error_message = "No operation was specified"
    [error_message | errors]
  end

  defp validate_operation(errors, operation) do
    error_message = "The operation \"#{operation}\" is not a valid operation"
    [error_message | errors]
  end

  @spec validate_operands(list(String.t()), list(number())) :: list(String.t())
  defp validate_operands(errors, operands) when length(operands) > 1 do
    errors
  end

  defp validate_operands(errors, operands) do
    error_message = "#{length(operands)} operands were specified. Two operands are required."

    [error_message | errors]
  end

  @spec validation_result(list(String.t()), Options.t()) :: validation_results()
  defp validation_result([], options) do
    {:ok, options}
  end

  defp validation_result(errors, _) do
    {:error, errors}
  end

  # Converts the arguments to either an options struct or a :help atom depending
  # on whether the help switch was set. This function assumes that argument validation
  # was successful.
  @spec args_to_options({parsed_switches(), parsed_additional_args()}) ::
          {:ok, Options.t() | :help}
  defp args_to_options({parsed_args, additional_args}) do
    # If the help switch was set, return :help, otherwise convert the arguments
    # to an options struct
    if contains_help_switch(parsed_args) do
      {:ok, :help}
    else
      {:ok,
       Options.new(
         Keyword.get(parsed_args, :operation),
         parse_operands(additional_args)
       )}
    end
  end

  # Convers a list of arguments to number operands
  @spec parse_operands(list(String.t())) :: list(number())
  defp parse_operands(args) do
    for arg <- args, do: parse_number(arg)
  end

  @spec parse_number(String.t()) :: number() | nil
  defp parse_number(arg) do
    case {Integer.parse(arg), Float.parse(arg)} do
      {:error, number} -> number
      {number, :error} -> number
      _ -> nil
    end
  end

  # Indicates whether the parse arguments contains the help switch
  @spec contains_help_switch(parsed_switches()) :: boolean()
  defp contains_help_switch(parsed_args) do
    Keyword.has_key?(parsed_args, :help)
  end
end
