defmodule Games.Guessing_Game do
  @moduledoc """
  Documentation for Games.GuessingGame

  Play a guessing game to guess a number between 1 and 10.
  """

  @doc """

  Prompt the user to enter a guess between 1 and 10.
  ## Examples
  ```elixir
  Games.Guessing_Game.play()
  ```
  """

  def play do
    answer = Enum.random(1..10)
    IO.puts("Welcome to the guessing game!")
    guess = IO.gets("Enter your guess number 1 to 10: ")
    IO.puts("You guessed #{guess}")

    trimmed_guess =
      guess
      |> Integer.parse()
      |> case do
        {trimmed_guess, _} -> trimmed_guess
        :error -> raise ArgumentError, message: "the argument value is invalid"
      end

    cond do
      trimmed_guess > 10 ->
        raise ArgumentError, message: "the argument value is invalid pick number between 1 to 10"

      answer == trimmed_guess ->
        IO.puts("Correct!")

      trimmed_guess > answer ->
        IO.puts("High!")

      trimmed_guess < answer ->
        IO.puts("Low!")
    end

    if trimmed_guess != answer do
      play()
    end
  end
end
