package strand

// DNAtoRNA provides the mapping of DNA nucleotides to RNA nucleotides.
var DNAtoRNA = map[string]string{
	"G": "C",
	"C": "G",
	"T": "A",
	"A": "U",
}

// ToRNA converts a DNA strand to an RNA strand.
func ToRNA(dna string) string {
	var result string

	for _, nucleotide := range dna {
		result += DNAtoRNA[string(nucleotide)]
	}

	return result
}
