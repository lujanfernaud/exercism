defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  @spec to_rna(charlist()) :: charlist()
  def to_rna(dna) do
    dna |> Enum.map(&dna_to_rna/1)
  end

  defp dna_to_rna(?G), do: ?C
  defp dna_to_rna(?C), do: ?G
  defp dna_to_rna(?T), do: ?A
  defp dna_to_rna(?A), do: ?U
end
