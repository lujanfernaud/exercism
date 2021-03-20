class Say
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

    handle_numbers(number.split(''))
  end

  private

  attr_reader :number

  def handle_numbers(numbers)
    case numbers.join.to_i
    when 0..9
      NUMBER_TO_WORD[numbers.first]
    when 10..99
      handle_tens(numbers)
    when 100..999
      convert(numbers, "hundred", start_index: 2)
    when 1000..999999
      convert(numbers, "thousand", start_index: 3)
    when 1000000..999999999
      convert(numbers, "million", start_index: 6)
    when 1000000000..999999999999
      convert(numbers, "billion", start_index: 9)
    else
      raise ArgumentError
    end
  end

  def convert(numbers, group_type, start_index:)
    end_index = start_index - 1

    initial = numbers.reverse[start_index..].reverse
    initial = "#{handle_numbers(initial)} #{group_type}"

    numbers = numbers.reverse[..end_index].reverse.join.match(/([1-9]+)/)&.send(:[], 1)&.split('')

    return initial if numbers.nil?

    "#{initial} #{handle_numbers(numbers)}".strip
  end

  def handle_tens(numbers)
    initial = NUMBER_TO_WORD.select { |number| number.match(/\A#{numbers[0]}\d\z/) }.values.first

    return unless initial

    "#{initial}-#{NUMBER_TO_WORD[numbers[1]]}"
  end
end
