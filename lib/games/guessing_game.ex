defmodule Games.Guessing_Game do
  def play do
    answer = Enum.random(1..10) |> IO.inspect()
    IO.puts("Welcome to the guessing game!")
    guess = IO.gets("Enter your guess: ")
    IO.puts("You guessed #{guess}")
    trimmed_guess = guess |> String.trim() |> String.to_integer() |> IO.inspect()

    if answer == trimmed_guess do
      IO.puts("You win!")
    else
      IO.puts("You lose!")
    end
  end
end
