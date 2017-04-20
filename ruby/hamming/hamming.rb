module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(string1, string2)
    raise ArgumentError, "Arguments length is not equal" unless
      string1.length == string2.length

    strand1     = string1.chars
    strand2     = string2.chars
    differences = []

    strand1.each.with_index do |char1, index1|
      differences << true unless char1 == strand2[index1]
    end

    differences.count
  end
end
