defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

  ## Examples

  iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
  true

  """

  @alphabet Enum.to_list(?a..?z)

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    (@alphabet -- characters_in(sentence)) |> Enum.empty?()
  end

  def characters_in(sentence), do: to_charlist(String.downcase(sentence))
end
