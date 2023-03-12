defmodule Games.Menu do
  @moduledoc """
  Documentation for Games.Menu
  Prompt the user with a menu to select which game they would like to play.
  """

  def display() do
    IO.puts("""
    Select a game:
      1. Guessing Game
      2. Rock Paper Scissors
      3. Wordle
    """)

    {choice, _} = IO.gets("Select: ") |> Integer.parse()

    case choice do
      1 -> Games.Guessing_Game.play()
      2 -> Games.RockPaperScissors.play()
      3 -> Games.Wordle.play()
    end

    user_opinion =
      IO.gets("Do you want to try other Games [y/n]:") |> String.trim() |> String.downcase()

    if user_opinion == "y" do
      display()
    else
      IO.puts("Bye! Bye!")
    end
  end
end
