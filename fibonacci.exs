defmodule Fibonacci do
  # def sequence(0), do: []
  # def sequence(n), do: sequence([0, 1], n-1)
  # def sequence(list, n), do: list
  def fib(0), do: 0
  def fib(1), do: 1

  def fib(n) do
    fib(n-1) + fib(n-2)
  end
end
Fibonacci.fib(10) |> IO.inspect
1..10 |> Enum.map(fn n -> Fibonacci.fib(n) end) |> IO.inspect

# 10 |> Fibonacci.sequence |> IO.inspect

# Can you think of how we could generate the fibonacci sequence, but without using lists?
