const notDna = /[^GCTA]/;

const dnaToRna = {
  G: 'C',
  C: 'G',
  T: 'A',
  A: 'U',
};

class Transcriptor {
  toRna([...strand]) {
    if (this.isNotADna(strand)) { throw new Error('Invalid input DNA.'); }

    return strand.map(nucleotide => dnaToRna[nucleotide]).join('');
  }

  isNotADna(strand) {
    return strand.join('').match(notDna);
  }
}

export default Transcriptor;
