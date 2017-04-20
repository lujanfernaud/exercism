module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(string_a, string_b)
    raise ArgumentError, "Arguments length is not equal" if string_a.length != string_b.length

    strand_a    = string_a.split("")
    strand_b    = string_b.split("")
    differences = []

    strand_a.each.with_index do |char_a, index_a|
      differences << true unless char_a == strand_b[index_a]
    end

    differences.count
  end
end
