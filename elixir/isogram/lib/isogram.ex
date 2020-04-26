defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> valid_characters_to_list()
    |> Enum.uniq()
    |> same_characters?(sentence)
  end

  defp valid_characters_to_list(sentence) do
    Regex.scan(~r{\w}, sentence)
  end

  defp same_characters?(valid_unique_characters, sentence) do
    valid_unique_characters == valid_characters_to_list(sentence)
  end
end
