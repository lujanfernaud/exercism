class Complement
  RNA_TO_DNA = { "G" => "C",
                 "C" => "G",
                 "T" => "A",
                 "A" => "U" }.freeze

  def self.of_dna(strand)
    return "" if strand =~ /[^GCTAU]/
    strand.gsub(/\w/) { |nucleotide| RNA_TO_DNA[nucleotide] }
  end
end

module BookKeeping
  VERSION = 4
end
