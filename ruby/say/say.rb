class Say
  LEADING_ZEROES_REGEX = /\A0+/

  NUMBER_TO_WORD = {
    "0" => "zero",
    "1" => "one",
    "2" => "two",
    "3" => "three",
    "4" => "four",
    "5" => "five",
    "6" => "six",
    "7" => "seven",
    "8" => "eight",
    "9" => "nine",
    "10" => "ten",
    "11" => "eleven",
    "12" => "twelve",
    "13" => "thirteen",
    "14" => "fourteen",
    "15" => "fifteen",
    "16" => "sixteen",
    "17" => "seventeen",
    "18" => "eighteen",
    "19" => "nineteen",
    "20" => "twenty",
    "30" => "thirty",
    "40" => "forty",
    "50" => "fifty",
    "60" => "sixty",
    "70" => "seventy",
    "80" => "eighty",
    "90" => "ninety",
  }.freeze

  def initialize(number)
    @number = number.to_s

    raise ArgumentError if number.negative?
  end

  def in_english
    return NUMBER_TO_WORD[number] if NUMBER_TO_WORD[number]

    convert_numbers(number.split(''))
  end

  private

  attr_reader :number

  def convert_numbers(numbers)
    return unless numbers

    case numbers.size
    when 13.. then raise ArgumentError
    when 4..12 then convert_big_numbers(numbers)
    when 3 then convert_hundreds(numbers)
    when 2 then convert_tens(numbers)
    else NUMBER_TO_WORD[numbers.first]
    end
  end

  def convert_big_numbers(numbers)
    number_groups = prepare_number_groups(numbers)

    big_groups = number_groups.slice(:billion, :million, :thousand).map do |type, numbers|
      "#{convert_numbers(numbers)} #{type}"
    end.join(" ").strip

    "#{big_groups} #{convert_numbers(number_groups[:hundred])}".strip
  end

  def prepare_number_groups(numbers)
    number_groups = numbers.reverse.each_slice(3).map { |group| prepare_group(group) }

    [:hundred, :thousand, :million, :billion].zip(number_groups).to_h.compact
  end

  def prepare_group(numbers)
    numbers = numbers.reverse.join.sub(LEADING_ZEROES_REGEX, "")

    return if numbers.empty?

    numbers.split("")
  end

  def convert_hundreds(numbers)
    hundreds = numbers.reverse[2..].reverse
    hundreds = "#{convert_numbers(hundreds)} hundred"

    numbers = numbers.reverse[..1].reverse.join.match(/([1-9]+)/)&.send(:[], 1)&.split('')

    "#{hundreds} #{convert_numbers(numbers)}".strip
  end

  def convert_tens(numbers)
    group = numbers[0] + "0"

    "#{NUMBER_TO_WORD[group]}-#{NUMBER_TO_WORD[numbers[1]]}"
  end
end
