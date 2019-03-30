class Luhn
  def self.valid?(numbers)
    new(numbers).valid?
  end

  def initialize(numbers)
    @numbers = sanitize(numbers)
  end

  def valid?
    return false if numbers.length <= 1 || numbers =~ /\D/

    (with_second_digits_doubled.sum % 10).zero?
  end

  private

  def sanitize(numbers)
    numbers.strip.gsub(/\s/, "")
  end

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
    @numbers.scan(/\d/)
  end

  def double(digit)
    doubled_digit = digit.to_i * 2

    return doubled_digit if doubled_digit < 9

    doubled_digit - 9
  end

  attr_reader :numbers
end
