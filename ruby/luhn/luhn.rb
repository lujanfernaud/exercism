class Luhn
  def self.valid?(numbers)
    new(numbers).valid?
  end

  def initialize(numbers)
    @numbers = sanitize(numbers)
  end

  def valid?
    return false if numbers.length <= 1 || numbers =~ /\D/

    (checksum % 10).zero?
  end

  private

  def sanitize(numbers)
    numbers.strip.gsub(/\s/, "")
  end

  def checksum
    [].tap do |array|
      parsed_digits.reverse.each_slice(2) do |pair|
        array << [pair[0].to_i, double(pair[1])]
      end
    end.flatten.sum
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
