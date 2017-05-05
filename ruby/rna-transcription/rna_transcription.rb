class Complement
  COMPLEMENTS = { "G" => "C",
                  "C" => "G",
                  "T" => "A",
                  "A" => "U" }.freeze

  def self.of_dna(nucleotide)
    return "" if nucleotide =~ /[^GCTAU]/
    nucleotide.gsub(/\w/) { |n| COMPLEMENTS[n] }
  end
end

module BookKeeping
  VERSION = 4
end
