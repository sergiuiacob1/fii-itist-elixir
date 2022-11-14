defmodule Guess do
  def guess(number) do
    input = IO.gets("Guess the number: ") |> String.trim
    case Integer.parse(input) do
      {guess, ""} ->
        check_guess(guess, number)
      {guess, _} ->
        IO.puts "You should input an integer, but got #{input}"
        guess(number)
      :error ->
        IO.puts "Invalid input"
        guess(number)
    end
  end

  def check_guess(guess, number) do
    cond do
      guess == number ->
        IO.puts "Good job!"
      true ->
        IO.puts "Wrong!"
        guess(number)
    end
  end
end


:rand.uniform(10) |> Guess.guess
