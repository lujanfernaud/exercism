defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    a =
      rna
      |> String.to_charlist()
      |> Enum.chunk_every(3)
      |> Enum.map(&codon_to_protein(List.to_string(&1)))

    {:ok, a}
    # rna
    # |> String.to_charlist()
    # |> Enum.chunk_every(3)
    # |> Enum.map(&of_codon(List.to_string(&1)))
    # |> Enum.find(fn k, _v -> k == :ok end)

    # |> Enum.map(&List.to_tuple(&1))
    # |> Enum.reduce(&List.to_tuple(&1))
    # |> List.to_tuple()
    # |> Map.merge(%{}, fn x, acc -> of_codon(List.to_string(x)) end)
    # |> Enum.reduce(%{}, fn x, acc -> of_codon(List.to_string(x)) end)
    # |> Enum.group_by(&Map.keys/1)
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
  defp codon_to_protein("UAA"), do: "STOP"
  defp codon_to_protein("UAG"), do: "STOP"
  defp codon_to_protein("UGA"), do: "STOP"
end
