class Complement
  def self.of_dna(nucleotide)
    case nucleotide
    when "G" then "C"
    when "C" then "G"
    when "T" then "A"
    when "A" then "U"
    end
  end
end
