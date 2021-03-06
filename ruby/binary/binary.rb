# Convert a binary number to its decimal equivalent.
class Binary
  BINARY = /\A[0-1]+\z/

  class << self
    def to_decimal(binary)
      raise ArgumentError, "#{binary} is not a correct binary number" unless
        binary.match(BINARY)

      binary = parse_and_reverse(binary)
      powers = powers_for_each(binary)

      convert(binary, powers)
    end

    def parse_and_reverse(binary)
      binary.chars.map(&:to_i).reverse
    end

    def powers_for_each(binary)
      binary.map.with_index { |_number, index| 2**index }
    end

    def convert(binary, powers)
      binary.map.with_index do |number, index|
        case number
        when 0 then 0
        when 1 then powers[index]
        end
      end.inject(:+)
    end
  end
end

module BookKeeping
  VERSION = 3
end
