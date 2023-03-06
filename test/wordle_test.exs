defmodule WordleTest do
  use ExUnit.Case
  doctest Games.Wordle

  describe "feedback/2" do
    test "all green" do
      # assert Games.Wordle.feedback("aaaaa", "aaaaa") == [:green, :green, :green, :green, :green]
      # assert Games.Wordle.feedback("aaa", "aaa") == [:green, :green, :green]
    end

    test "all grey" do
      # assert Games.Wordle.feedback("aaaaa", "bbbbb") == [:grey, :grey, :grey, :grey, :grey]
      # assert Games.Wordle.feedback("aaa", "bbb") == [:grey, :grey, :grey]
    end

    test "all yellow" do
      # assert Games.Wordle.feedback("aabbc", "bbcaa") == [:yellow, :yellow, :yellow, :yellow, :yellow]
    end

     test "mixed" do
      # assert Games.Wordle.feedback("aabbc", "babad") == [:yellow, :green, :green, :yellow, :grey]
    end

    test "greens at the end" do
      # assert Games.Wordle.feedback("ababc", "bbabc") == [:grey, :green, :green, :green, :green]
    end

    test "same character with green, yellow, and grey feedback" do
      # assert Games.Wordle.feedback("aaabb", "xaaaa") == [:grey, :green, :green, :yellow, :grey]
    end
  end
end
