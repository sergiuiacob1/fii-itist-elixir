defmodule Hello do
  def hello do
    IO.puts "Hello, Elixir!"
  end
  def smile, do: "😄"
  def wave, do: "👋"
end

Hello.hello

# Smile and wave boys, smile and wave 🐧
Hello.smile() <> " " <> Hello.wave() |> IO.puts
