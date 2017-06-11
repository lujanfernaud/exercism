module Grains
  VALID_NUMBERS = [*1..64]

  def self.square(number)
    raise ArgumentError, "Number not valid" unless
      VALID_NUMBERS.include?(number)

    [*1..number].inject { |num| num * 2 }
  end

  def self.total
    VALID_NUMBERS.inject { |num| num * 2 } * 2 - 1
  end
end

module BookKeeping
  VERSION = 1
end
