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
    case numbers.size
    when 13.. then raise ArgumentError
    when 10..12 then handle_billions(numbers)
    when 7..9 then handle_millions(numbers)
    when 4..6 then handle_thousands(numbers)
    when 4..12 then aaa(numbers)
    when 3 then handle_hundreds(numbers)
    when 2 then handle_tens(numbers)
    else NUMBER_TO_WORD[numbers.first]
    end
  end

  def handle_billions(numbers)
    initial = numbers.reverse[9..].reverse
    initial = "#{handle_numbers(initial)} billion"

    numbers = numbers.reverse[..8].reverse.join.match(/([1-9]+)/)&.send(:[], 1)&.split('')

    return initial if numbers.nil?

    "#{initial} #{handle_numbers(numbers)}".strip
  end

  def handle_millions(numbers)
    initial = numbers.reverse[6..].reverse
    initial = "#{handle_numbers(initial)} million"

    numbers = numbers.reverse[..5].reverse.join.match(/([1-9]+)/)&.send(:[], 1)&.split('')

    return initial if numbers.nil?

    "#{initial} #{handle_numbers(numbers)}".strip
  end

  def handle_thousands(numbers)
    initial = numbers.reverse[3..].reverse
    initial = "#{handle_numbers(initial)} thousand"

    numbers = numbers.reverse[..2].reverse.join.match(/([1-9]+)/)&.send(:[], 1)&.split('')

    return initial if numbers.nil?

    "#{initial} #{handle_numbers(numbers)}".strip
  end

  def handle_hundreds(numbers)
    initial = numbers.reverse[2..].reverse
    initial = "#{handle_numbers(initial)} hundred"

    numbers = numbers.reverse[..1].reverse.join.match(/([1-9]+)/)&.send(:[], 1)&.split('')

    return initial if numbers.nil?

    "#{initial} #{handle_numbers(numbers)}".strip
  end

  def handle_tens(numbers)
    group = numbers[0] + "0"
    initial = NUMBER_TO_WORD[group]

    return unless initial

    "#{NUMBER_TO_WORD[group]}-#{NUMBER_TO_WORD[numbers[1]]}"
  end
end
