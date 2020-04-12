defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[^-a-zA-Z0-9\p{L}]|^_/u, " ")
    |> String.split()
    |> Enum.frequencies()
  end
end
