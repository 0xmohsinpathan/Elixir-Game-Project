defmodule Games.RockPaperScissors do
  def play do
    IO.puts("Choose rock paper or scissors!")
    ai_choice = Enum.random([:rock,:paper,:scissors]) |> IO.inspect()
    player_1 = IO.gets("Player 1: ") |> String.trim() |> String.to_atom() |>IO.inspect()
    # {player_1, _rest} = IO.gets{"Payer 1: "} |> Integer.parse() |> String.to_atom()
   # trimmed_guess = String.trim(guess) |> String.to_integer() |> IO.inspect()

 case {player_1, ai_choice} do
   {_same, _same} -> "Draw"
  {:rock, :scissors} -> "Player 1 Wins!"
  {:paper, :rock} -> "Player 1 Wins!"
  {:scissors, :paper} -> "Player 1 Wins!"
  _ -> "AI Wins!"

  end
  end
end
