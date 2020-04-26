defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> valid_characters_to_list()
    |> Enum.uniq()
    |> unique_characters?(sentence)
  end

  defp valid_characters_to_list(sentence) do
    sentence
    |> String.replace(~r{\W}, "")
    |> String.split("", trim: true)
  end

  defp unique_characters?(valid_characters, sentence) do
    Enum.count(valid_characters) == valid_characters_to_list(sentence) |> Enum.count()
  end
end
