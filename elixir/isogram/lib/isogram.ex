defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    characters = Regex.scan(~r{\w}, sentence)

    characters == Enum.uniq(characters)
  end
end
