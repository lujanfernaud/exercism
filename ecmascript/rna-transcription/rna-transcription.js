const notDna = /[^GCTA]/;

const dnaToRna = {
  G: 'C',
  C: 'G',
  T: 'A',
  A: 'U',
};

class Transcriptor {
  toRna(strand) {
    if (strand.match(notDna)) { throw new Error('Invalid input DNA.'); }

    const dnaStrand = strand.split('');

    function toRna(nucleotide) { return dnaToRna[nucleotide]; }

    return dnaStrand.map(toRna).join('');
  }
}

export default Transcriptor;
