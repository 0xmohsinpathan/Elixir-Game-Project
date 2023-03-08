defmodule Games.Wordle do
  use GenServer
  defstruct [:Secret_Word, :Guesses, :Attends]

  @moduledoc """
  Documentation for Games.Wordle

  Play a wordle game to guess a randomly generated 5-letter word.
  Display colored feedback to the user based on their guess and the answer.

  * green: letter is in the answer and in the correct position
  * yellow: letter is in the answer but in the wrong position
  * grey: letter is not in the answer
  """

  # TODO complete my wordle project

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %__MODULE__{
      Secret_Word: answer_guesses(),
      Guesses: [],
      Attends: 6
    })
  end

  def guessing_letter(guess_pid, letter) do
    GenServer.call(guess_pid, {:guesses, letter})
  end

  # @doc """

  # Prompts the user to enter a five letter word and starts the game in a recursive loop.

  # ```elixir
  # Games.Wordle.play()
  # ```
  # """

  # Client
  def init(state) do
    {:ok, state}
  end

  def handle_call({:guesses, letter}, _from, state) do
  end

  defp answer_guesses() do
    ["Apple", "Tiger", "Grape", "House", "Plant", "River", "Party", "Earth", "Ocean", "Bread", "Happy",
 "Music", "Child", "Watch", "Beach", "Smile", "Angel", "Dream", "Light", "Water", "Lemon", "Chair",
 "Sleep", "Pizza", "Dance", "Shoes", "Heart", "Paper", "Money", "Honey"] |> Enum.random()
  end

  defp pair_list(answer_guesses, guess) do
    list_answer = String.graphemes(answer_guesses)
    list_guess = String.graphemes(guess)
  end
end
