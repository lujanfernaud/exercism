defmodule ProteinTranslation do
  @stop "STOP"

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    proteins =
      rna
      |> String.to_charlist()
      |> Enum.chunk_every(3)
      |> Enum.map(&codon_to_protein(List.to_string(&1)))
      |> Enum.filter(fn protein -> protein != @stop end)

    {:ok, proteins}
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    {:ok, codon_to_protein(codon)}
  end

  defp codon_to_protein("UGU"), do: "Cysteine"
  defp codon_to_protein("UGC"), do: "Cysteine"
  defp codon_to_protein("UUA"), do: "Leucine"
  defp codon_to_protein("UUG"), do: "Leucine"
  defp codon_to_protein("AUG"), do: "Methionine"
  defp codon_to_protein("UUU"), do: "Phenylalanine"
  defp codon_to_protein("UUC"), do: "Phenylalanine"
  defp codon_to_protein("UCU"), do: "Serine"
  defp codon_to_protein("UCC"), do: "Serine"
  defp codon_to_protein("UCA"), do: "Serine"
  defp codon_to_protein("UCG"), do: "Serine"
  defp codon_to_protein("UGG"), do: "Tryptophan"
  defp codon_to_protein("UAU"), do: "Tyrosine"
  defp codon_to_protein("UAC"), do: "Tyrosine"
  defp codon_to_protein("UAA"), do: @stop
  defp codon_to_protein("UAG"), do: @stop
  defp codon_to_protein("UGA"), do: @stop
end
