defmodule Fibonacci do
  def sequence(0), do: []
  def sequence(n), do: sequence([0, 1], n-1)
  def sequence(list, 0), do: list
  def sequence(list, n) do
    last = Enum.at(list, -1)
    prev_last = Enum.at(list, -2)
    next = prev_last + last
    sequence(list ++ [next], n-1)
  end
end

10 |> Fibonacci.sequence |> IO.inspect
