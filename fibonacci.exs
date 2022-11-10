defmodule Fibonacci do
  def sequence(0), do: []
  def sequence(n), do: sequence([0, 1], n-1)
  def sequence(list, n), do: list
end

10 |> Fibonacci.sequence |> IO.inspect

# Can you think of how we could generate the fibonacci sequence, but without using lists?
