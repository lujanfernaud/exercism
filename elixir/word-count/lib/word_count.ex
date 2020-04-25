defmodule WordCount do
  @non_word_characters_regexp ~r/[^-[:word:]]|_/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(@non_word_characters_regexp, trim: true)
    |> Enum.reduce(%{}, &word_with_count(&1, &2))
  end

  defp word_with_count(word, acc) do
    Map.update(acc, word, 1, fn count -> count + 1 end)
  end
end
