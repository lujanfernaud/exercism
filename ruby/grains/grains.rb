module Grains
  def self.square(number)
    raise ArgumentError, "Number not valid" unless (1..64).cover?(number)

    2**number / 2
  end

  def self.total
    2**64 - 1
  end
end

module BookKeeping
  VERSION = 1
end
