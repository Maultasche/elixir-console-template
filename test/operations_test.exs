defmodule ElixirConsoleTemplate.Operations.Test do
  use ExUnit.Case, async: true
  doctest ElixirConsoleTemplate.Operations

  alias ElixirConsoleTemplate.Operations

  describe "add - " do
    test "adding two positive numbers" do
      add_test(2, 3, 5)
    end

    test "adding a positive number and a zero" do
      add_test(8, 0, 8)
    end

    test "adding a positive number and a negative number" do
      add_test(4, -4, 0)
    end

    test "adding a negative number and a zero" do
      add_test(-10, 0, -10)
    end

    test "adding two negative numbers" do
      add_test(-8, -5, -13)
    end

    defp add_test(x, y, expected_result) do
      operation_test(&Operations.add/2, x, y, expected_result)
    end
  end

  describe "subtract - " do
    test "subtracting two positive numbers" do
      subtract_test(3, 2, 1)
    end

    test "subtracting a positive number from zero" do
      subtract_test(0, 4, -4)
    end

    test "subtracting zero from a positive number" do
      subtract_test(4, 0, 4)
    end

    test "subtracting a positive number from a negative number" do
      subtract_test(-7, 2, -9)
    end

    test "subtracting a negative number from zero" do
      subtract_test(0, 2, -2)
    end

    test "subtracting zero from a negative number" do
      subtract_test(-7, 0, -7)
    end

    test "subtracting two negative numbers" do
      subtract_test(-9, -4, -5)
    end

    test "subtracting a large number from a small number" do
      subtract_test(2, 15, -13)
    end

    test "subtracting a small number from a large number" do
      subtract_test(23, 3, 20)
    end

    defp subtract_test(x, y, expected_result) do
      operation_test(&Operations.subtract/2, x, y, expected_result)
    end
  end

  describe "multiply - " do
    test "multiplying two positive numbers" do
      multiply_test(4, 3, 12)
    end

    test "multiplying a positive number by zero" do
      multiply_test(0, 4, 0)
    end

    test "multiplying a positive number by a negative number" do
      multiply_test(-7, 2, -14)
    end

    test "multiplying a negative number by zero" do
      multiply_test(0, -2, 0)
    end

    test "multiplying two negative numbers" do
      multiply_test(-8, -5, 40)
    end

    defp multiply_test(x, y, expected_result) do
      operation_test(&Operations.multiply/2, x, y, expected_result)
    end
  end

  describe "divide - " do
    test "dividing two positive numbers" do
      divide_test(10, 2, 5)
    end

    test "dividing a positive number by zero" do
      divide_test_throws(4, 0, ArithmeticError)
    end

    test "dividing zero by a positive number" do
      divide_test(0, 4, 0)
    end

    test "dividing a positive number by a negative number" do
      divide_test(6, -2, -3)
    end

    test "dividing a negative number by zero" do
      divide_test_throws(-6, 0, ArithmeticError)
    end

    test "dividing zero by a negative number" do
      divide_test(0, -6, 0)
    end

    test "dividing two negative numbers" do
      divide_test(-12, -2, 6)
    end

    defp divide_test(x, y, expected_result) do
      operation_test(&Operations.divide/2, x, y, expected_result)
    end

    defp divide_test_throws(x, y, error_type) do
      assert_raise error_type, fn ->
        divide_test(x, y, 0)
      end
    end
  end

  defp operation_test(operation, x, y, expected_result) do
    result = operation.(x, y)

    assert result == expected_result
  end
end
