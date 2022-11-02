defmodule Gauss do
  def sum(n) do
    n * (n + 1) / 2
  end
end

10 |> Gauss.sum |> IO.puts
