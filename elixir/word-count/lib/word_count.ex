defmodule WordCount do
  @non_word_characters_regexp ~r/[^-a-z0-9\p{L}]|^_/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(@non_word_characters_regexp, " ")
    |> String.split()
    |> Enum.frequencies()
  end
end
