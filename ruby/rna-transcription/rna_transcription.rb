class Complement
  def self.of_dna(nucleotide)
    return "" if nucleotide =~ /[^GCTAU]/
    complements = { "G" => "C", "C" => "G", "T" => "A", "A" => "U" }
    nucleotide.gsub(/\w/) { |n| complements[n] }
  end
end

module BookKeeping
  VERSION = 4
end
