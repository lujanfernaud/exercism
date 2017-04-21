class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError, "Arguments length is not equal" unless
      strand1.length == strand2.length

    strands   = strand1.chars.zip(strand2.chars)
    different = proc { |n1, n2| n1 != n2 }

    strands.count(&different)
  end
end

module BookKeeping
  VERSION = 3
end
