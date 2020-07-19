defmodule ElixirConsoleTemplate.Operations do
  @valid_operations ["add", "sub", "mult", "div"]

  @spec valid_operations() :: list(String.t())
  def valid_operations(), do: @valid_operations

  @doc """
  Adds two numbers

  ## Parameters

  - x: the first number to add
  - y: the second number to add

  ## Returns

  The result of the addition

  ## Examples

    iex> ElixirConsoleTemplate.Operations.add(8, 4)
    12
    iex> ElixirConsoleTemplate.Operations.add(8, 0)
    8
    iex> ElixirConsoleTemplate.Operations.add(10, -6)
    4
  """
  @spec add(number(), number()) :: number()
  def add(x, y) do
    x + y
  end

  @doc """
  Divides two numbers

  ## Parameters

  - x: the number to divided (the dividend)
  - y: the number to use in dividing (the divisor)

  ## Returns

  The result of the division

  ## Examples

    iex> ElixirConsoleTemplate.Operations.divide(5, 4)
    1.25
    iex> ElixirConsoleTemplate.Operations.divide(8, 2)
    4.0
    iex> ElixirConsoleTemplate.Operations.divide(0, 6)
    0.0
    iex> ElixirConsoleTemplate.Operations.divide(5, 0)
    ** (ArithmeticError) bad argument in arithmetic expression
  """
  @spec divide(number(), number()) :: number()
  def divide(x, y) do
    x / y
  end

  @doc """
  Multiplies two numbers

  ## Parameters

  - x: the first number to multiply
  - y: the second number to multiply

  ## Returns

  The result of the multiplication

  ## Examples

    iex> ElixirConsoleTemplate.Operations.multiply(3, 5)
    15
    iex> ElixirConsoleTemplate.Operations.multiply(8, 0)
    0
    iex> ElixirConsoleTemplate.Operations.multiply(10, -6)
    -60
  """
  @spec multiply(number(), number()) :: number()
  def multiply(x, y) do
    x * y
  end

  @doc """
  Subtracts two numbers

  ## Parameters

  - x: the number to be subtracted from
  - y: the number to subtract

  ## Returns

  The result of the subtraction

  ## Examples

    iex> ElixirConsoleTemplate.Operations.subtract(5, 4)
    1
    iex> ElixirConsoleTemplate.Operations.subtract(-4, 2)
    -6
    iex> ElixirConsoleTemplate.Operations.subtract(10, -6)
    16
  """
  @spec subtract(number(), number()) :: number()
  def subtract(x, y) do
    x - y
  end
end
