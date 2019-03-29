class Luhn
  def self.valid?(numbers_string)
    new(numbers_string).valid?
  end

  def initialize(numbers_string)
    @numbers_string = numbers_string
  end

  def valid?
    return false if sanitized_string.length <= 1 || sanitized_string =~ /\D/

    (with_second_digits_doubled.sum % 10).zero?
  end

  private

  def sanitized_string
    @sanitized_string ||= @numbers_string.strip.gsub(/\s/, "")
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
    @numbers_string.scan(/\d/)
  end

  def double(digit)
    doubled_digit = digit.to_i * 2

    return doubled_digit if doubled_digit < 9

    doubled_digit - 9
  end
end
