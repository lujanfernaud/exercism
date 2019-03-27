class Luhn
  def self.valid?(numbers_string)
    new(numbers_string).valid?
  end

  def initialize(numbers_string)
    @numbers_string = numbers_string
  end

  def valid?
    return false if numbers_string.strip.length <= 1
    return false if numbers_string.gsub(/\s/, "") =~ /\D/

    (with_second_digits_doubled.sum % 10).zero?
  end

  private

  def with_second_digits_doubled
    parsed_digits.reverse.map.with_index do |digit, index|
      if index.even?
        digit.to_i
      else
        double(digit)
      end
    end.reverse
  end

  def parsed_digits
    numbers_string.scan(/\d/)
  end

  def double(digit)
    doubled_digit = digit.to_i * 2

    return doubled_digit if doubled_digit < 9

    doubled_digit - 9
  end

  attr_reader :numbers_string
end
