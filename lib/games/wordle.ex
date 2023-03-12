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

  # def play(guess_word) do
  # end

  def feedback(guess_word, answer_word) do
    zip_list = zip_list(guess_word, answer_word) |> Enum.unzip()

    zip_list
    |> check_green()
    |> check_yellow()
    |> check_grey()
  end

  defp check_green({guess_list, answer_list}) do
  Enum.zip(guess_list, answer_list)
    |> Enum.map(fn
      {char, char} -> {:green, nil}
      pair -> pair
    end)
    |> Enum.unzip()
    |> IO.inspect()
  end

  defp check_yellow({guess_list, answer_list}) do
    Enum.reduce(guess_list, {[], answer_list}, fn guess_char, {result, answer_list} ->
      answer_index = Enum.find_index(answer_list, fn answer_char -> answer_char == guess_char end)

      if answer_index do
        {result ++ [:yellow], List.replace_at(answer_list, answer_index, nil)} |> IO.inspect()
      else
        {result ++ [guess_char], answer_list} |> IO.inspect()
      end
    end)
  end

  defp check_grey({guess_list, answer_list}) do
    Enum.zip(guess_list, answer_list)
    |> Enum.map(fn
      {:green, _answer_char} -> {:green, nil}
      {:yellow, _answer_char} -> {:yellow, nil}
      _ -> {:grey, nil}
    end)|> Enum.unzip()
  end

  defp zip_list(guess_word, answer_word) do
    list_answer_char = String.graphemes(answer_word)
    list_guess_char = String.graphemes(guess_word)
    Enum.zip(list_answer_char, list_guess_char)
  end

  defp answer_guesses do
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
