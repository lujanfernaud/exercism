# Convert a binary number to its decimal equivalent.
class Binary
  NOT_BINARY = /[^0-1]/

  class << self
    def to_decimal(binary)
      raise ArgumentError, "#{binary} is not a correct binary number" if
        binary =~ NOT_BINARY

      return 0 if binary.to_i.zero?

      binary = parse_and_reverse(binary)
      powers = powers_for_each(binary)

      convert(binary, powers)
    end

    def parse_and_reverse(binary)
      binary.each_char.map(&:to_i).reverse
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
