defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  def to_rna(dna) do
    dna |> Enum.map(&dna_to_rna(&1))
  end

  defp dna_to_rna(_dna = ?G), do: ?C
  defp dna_to_rna(_dna = ?C), do: ?G
  defp dna_to_rna(_dna = ?T), do: ?A
  defp dna_to_rna(_dna = ?A), do: ?U
end
