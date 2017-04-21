class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError, "Arguments length is not equal" unless
      strand1.length == strand2.length

    strand1   = strand1.chars
    strand2   = strand2.chars
    different = proc { |char1, char2| true unless char1 == char2 }

    strand1.zip(strand2).count(&different)
  end
end

module BookKeeping
  VERSION = 3
end
