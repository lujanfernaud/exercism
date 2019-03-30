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
    digits.reverse.each_slice(2).sum do |even = 0, odd|
      even + double(odd)
    end
  end

  def digits
    number.scan(/\d/).map(&:to_i)
  end

  def double(digit)
    doubled_digit = digit * 2

    return doubled_digit if doubled_digit < 9

    doubled_digit - 9
  end

  attr_reader :number
end
