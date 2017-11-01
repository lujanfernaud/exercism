class PhoneNumber
  VALID_PHONE_NUMBER = /^([2-9]\d\d){2}\d{4}$/

  def self.clean(number)
    numbers = number.gsub(/\D/, "").sub(/^1/, "")

    return nil unless numbers =~ VALID_PHONE_NUMBER

    numbers
  end
end

module BookKeeping
  VERSION = 2
end
