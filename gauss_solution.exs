defmodule Gauss do
  # def sum(0), do: 0
  # def sum(n) do
  #   n + sum(n-1)
  # end

  def sum(n) do
    1..n |> Enum.reduce(fn number, acc -> acc + number end)
  end
end

10 |> Gauss.sum |> IO.puts
