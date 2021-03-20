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
  end

  def in_english
    handle_numbers(@number.chars)
  end

  private

  def handle_numbers(numbers)
    case numbers.join.to_i
    when 0..99
      convert_tens(numbers)
    when 100..999
      convert(numbers, "hundred", start_index: 2)
    when 1_000..999_999
      convert(numbers, "thousand", start_index: 3)
    when 1_000_000..999_999_999
      convert(numbers, "million", start_index: 6)
    when 1_000_000_000..999_999_999_999
      convert(numbers, "billion", start_index: 9)
    else
      raise ArgumentError
    end
  end

  def convert(numbers, group_type, start_index:)
    end_index = start_index - 1

    initial = numbers.reverse[start_index..].reverse
    initial = "#{handle_numbers(initial)} #{group_type}"

    remaining = numbers.reverse[..end_index].reverse
    remaining = remove_leading_zeroes(remaining)

    return initial if remaining.nil?

    "#{initial} #{handle_numbers(remaining)}"
  end

  def remove_leading_zeroes(numbers)
    numbers.join.match(/([1-9]+)/)&.send(:[], 1)&.chars
  end

  def convert_tens(numbers)
    return NUMBER_TO_WORD[numbers.join] if NUMBER_TO_WORD[numbers.join]

    initial = NUMBER_TO_WORD.select { |number| number.match(/\A#{numbers[0]}\d\z/) }.values.first

    return unless initial

    "#{initial}-#{NUMBER_TO_WORD[numbers[1]]}"
  end
end
