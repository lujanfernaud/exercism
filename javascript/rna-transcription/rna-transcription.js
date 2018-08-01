var NOT_DNA = /[^GCTA]/;

var DnaTranscriber = function() {};

DnaTranscriber.prototype.toRna = function(strand) {
  if (strand.match(NOT_DNA)) { throw new Error('Invalid input'); }

  dnaStrand = strand.split('');

  var dnaToRna = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U'
  };

  function toRna(nucleotide) { return dnaToRna[nucleotide]; }

  return dnaStrand.map(toRna).join('');
};

module.exports = DnaTranscriber;
