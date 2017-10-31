class PhoneNumber
  def self.clean(number)
    only_numbers = number.gsub(/\D/, "").sub(/^1/, "")
    valid_phone_number = /^([2-9]\d\d){2}\d{4}$/

    return nil unless only_numbers =~ valid_phone_number

    only_numbers
  end
end

module BookKeeping
  VERSION = 2
end
