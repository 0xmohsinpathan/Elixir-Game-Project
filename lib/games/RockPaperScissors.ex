defmodule Games.RockPaperScissors do
  @moduledoc """
  Documentation for Games.RockPaperScissors
  Play rock paper scissors against a randomly generated AI opponent.
  """

  @doc """

  Prompt the user to input either rock, paper, or scissors.

  ```elixir
  Games.RockPaperScissors.play()
  ```
  """
  def play do
    IO.puts("Choose Rock, Paper, Scissors!")
    ai_choice = Enum.random([:rock]) #:paper, :scissors
    player_choice = IO.gets(["rock/paper/scissors: "]) |> String.trim() |> String.to_atom()

    cond do
      ai_choice == player_choice ->
        IO.puts("Draw")

      beats?(ai_choice, player_choice) ->
        IO.puts("AI WIN")

      beats?(player_choice, ai_choice) ->
        IO.puts("You WIN")

      true ->
        raise("your input is invalid. Please correct this: rock/paper/scissors")
    end
    if player_choice == ai_choice do
      play()
    end

  end

  defp beats?(player1, player2) do
    {player1, player2} in [{:rock, :scissors}, {:scissors, :paper}, {:paper, :rock}]
  end
end
