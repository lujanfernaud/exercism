class PhoneNumber
  def self.clean(number)
    only_numbers = number.gsub(/\D/, "")
    valid_phone_number = /^(?:[2-9]\d{2}[2-9]\d{2}\d{4})$|^1(?:[2-9]\d{2}[2-9]\d{2}\d{4})$/

    return nil unless only_numbers =~ valid_phone_number

    case only_numbers.length
    when 10 then only_numbers
    when 11 then only_numbers[1..-1]
    end
  end
end

module BookKeeping
  VERSION = 2
end
