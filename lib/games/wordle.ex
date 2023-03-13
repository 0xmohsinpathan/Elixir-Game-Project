defmodule Games.Wordle do
  @moduledoc """
  Documentation for Games.Wordle

  Play a wordle game to guess a randomly generated 5-letter word.

  The game prompts the user to enter their guesses for the word and provides colored feedback based on whether the guessed letters are correct, incorrect, or in the correct but wrong position.

  * green: letter is in the answer and in the correct position
  * yellow: letter is in the answer but in the wrong position
  * grey: letter is not in the answer

  At most 6 attempts can be made to solve the game.
  """

  # TODO complete my wordle project

  # @doc """

  # Prompts the user to enter a five letter word and starts the game in a recursive loop.

  # ```elixir
  # Games.Wordle.play()
  # ```
  # """

  def play(answer \\ random_AI(), attempt \\ 0)
  def play(answer, 6), do: IO.puts("Wrong! The answer was #{answer}")

  def play(answer, attempt) do
    guess = IO.gets("Please Enter Five Letter Words: ") |> String.trim() |> String.downcase()
    answer = String.downcase(answer)

    if guess == answer do
      IO.puts("WOW! You Guess Right")
    else
      feedback_list = feedback(answer, guess)
      IO.puts(inspect(feedback_list))
      play(answer, attempt + 1)
    end
  end

  def feedback(guess_word, answer_word) do
    zip_list = zip_list(guess_word, answer_word) |> Enum.unzip()

    zip_list
    |> check_green()
    |> check_yellow()
    |> check_grey()
  end

  defp check_green({guess_list, answer_list}) do
    for {guess_char, answer_char} <- Enum.zip(guess_list, answer_list) do
      if(guess_char == answer_char, do: {:green, nil}, else: {guess_char, answer_char})
    end
    |> Enum.unzip()
  end

  defp check_yellow({guess_list, answer_list}) do
    Enum.reduce(guess_list, {[], answer_list}, fn guess_char, {result, answer_list} ->
      answer_index = Enum.find_index(answer_list, fn answer_char -> answer_char == guess_char end)

      if answer_index do
        {result ++ [:yellow], List.replace_at(answer_list, answer_index, nil)}
      else
        {result ++ [guess_char], answer_list}
      end
    end)
  end

  defp check_grey({guess_list, answer_list}) do
    {result, _} =
      Enum.zip(guess_list, answer_list)
      |> Enum.map(fn
        {:green, _answer_char} -> {:green, nil}
        {:yellow, _answer_char} -> {:yellow, nil}
        _ -> {:grey, nil}
      end)
      |> Enum.unzip()

    result
  end

  defp zip_list(guess_word, answer_word) do
    list_answer_char = String.graphemes(answer_word)
    list_guess_char = String.graphemes(guess_word)
    Enum.zip(list_answer_char, list_guess_char)
  end

  defp random_AI do
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
      "Honey",
      "Bread",
      "Chair",
      "Dance",
      "Dream",
      "Earth",
      "Field",
      "Ghost",
      "Happy",
      "Image",
      "Juice",
      "Lemon",
      "Music",
      "Ocean",
      "Party",
      "Queen",
      "River",
      "Sleep",
      "Tiger",
      "Water",
      "Youth",
      "Zebra"
    ]
    |> Enum.random()
  end
end
