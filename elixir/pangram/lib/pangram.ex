defmodule Pangram do
  @alphabet "abcdefghijklmnopqrstuvwxyz"

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(""), do: false

  def pangram?(sentence) do
    sorted_unique_letters_in(sentence) == @alphabet
  end

  defp sorted_unique_letters_in(sentence) do
    sentence
    |> String.downcase()
    |> String.codepoints()
    |> Enum.uniq()
    |> Enum.filter(&String.match?(&1, ~r{[a-z]}))
    |> Enum.sort()
    |> Enum.join()
  end
end
