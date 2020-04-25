defmodule WordCount do
  @non_word_characters_regexp ~r/[^-[:word:]]|_/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> split_into_words()
    |> Enum.reduce(%{}, &count_word(&1, &2))
  end

  defp split_into_words(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(@non_word_characters_regexp, " ")
    |> String.split()
  end

  defp count_word(word, acc) do
    Map.update(acc, word, 1, fn count -> count + 1 end)
  end
end
