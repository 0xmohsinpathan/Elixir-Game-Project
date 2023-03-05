defmodule Games do
  @moduledoc """
  Documentation for `Games`.
  """

  @doc """
  Starts the Games CLI. Used by Escript.
  """
  def main(_args) do
    Games.Menu.display()
  end
end
