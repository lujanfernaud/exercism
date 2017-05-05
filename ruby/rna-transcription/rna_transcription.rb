class Complement
  DNA_TO_RNA = { "G" => "C",
                 "C" => "G",
                 "T" => "A",
                 "A" => "U" }.freeze

  def self.of_dna(strand)
    return "" if strand =~ /[^GCTAU]/
    strand.gsub(/\w/) { |nucleotide| DNA_TO_RNA[nucleotide] }
  end
end

module BookKeeping
  VERSION = 4
end
