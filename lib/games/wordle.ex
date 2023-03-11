defmodule Games.Wordle do

  @moduledoc """
  Documentation for Games.Wordle

  Play a wordle game to guess a randomly generated 5-letter word.
  Display colored feedback to the user based on their guess and the answer.

  * green: letter is in the answer and in the correct position
  * yellow: letter is in the answer but in the wrong position
  * grey: letter is not in the answer
  """
  # TODO complete my wordle project

  # @doc """

  # Prompts the user to enter a five letter word and starts the game in a recursive loop.

  # ```elixir
  # Games.Wordle.play()
  # ```
  # """

  # Client




  

  defp answer_guesses() do
    [
      "Apple",
      "Tiger",
      "Grape",
      "House",
      "Plant",
      "River",
      "Party",
      "Earth",
      "Ocean",
      "Bread",
      "Happy",
      "Music",
      "Child",
      "Watch",
      "Beach",
      "Smile",
      "Angel",
      "Dream",
      "Light",
      "Water",
      "Lemon",
      "Chair",
      "Sleep",
      "Pizza",
      "Dance",
      "Shoes",
      "Heart",
      "Paper",
      "Money",
      "Honey"
    ]
    |> Enum.random()
  end
end
