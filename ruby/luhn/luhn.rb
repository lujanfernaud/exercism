class Luhn
  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = sanitize(number)
  end

  def valid?
    return false if number.length <= 1 || number =~ /\D/

    (checksum % 10).zero?
  end

  private

  def sanitize(number)
    number.strip.gsub(/\s/, "")
  end

  def checksum
    digits.reverse.each_slice(2).sum do |even, odd|
      even.to_i + double(odd)
    end
  end

  def digits
    number.scan(/\d/)
  end

  def double(digit)
    doubled_digit = digit.to_i * 2

    return doubled_digit if doubled_digit < 9

    doubled_digit - 9
  end

  attr_reader :number
end
