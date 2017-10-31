class PhoneNumber
  def self.clean(number)
    only_numbers = number.gsub(/\D/, "")
    valid_phone_number = /^[2-9]\d{2}[2-9]\d{2}\d{4}$|^1[2-9]\d{2}[2-9]\d{2}\d{4}$/

    return nil unless only_numbers =~ valid_phone_number

    only_numbers.length == 10 ? only_numbers : only_numbers[1..-1]
  end
end

module BookKeeping
  VERSION = 2
end
