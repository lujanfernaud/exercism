class PhoneNumber
  def self.clean(number)
    numbers = number.gsub(/\D/, "").sub(/^1/, "")
    valid_phone_number = /^([2-9]\d\d){2}\d{4}$/

    return nil unless numbers =~ valid_phone_number

    numbers
  end
end

module BookKeeping
  VERSION = 2
end
