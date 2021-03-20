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
    raise ArgumentError if number.negative?
    raise ArgumentError if number >= 999_999_999_999

    @number = number.to_s
  end

  def in_english
    return NUMBER_TO_WORD[number] if NUMBER_TO_WORD[number]
    return convert_tens(number) if number.size == 2

    convert_big_number(number)
  end

  private

  attr_reader :number

  def convert_tens(numbers)
    tens = numbers[0] + "0"

    "#{NUMBER_TO_WORD[tens]}-#{NUMBER_TO_WORD[numbers[1]]}"
  end

  def convert_big_number(number)
    number_groups = PrepareNumberGroups.call(number.chars)

    number_groups.map do |type, numbers|
      convert_group(numbers, type)
    end.join(" ").strip
  end

  def convert_group(numbers, type)
    return "#{NUMBER_TO_WORD[numbers.first]} #{type}" if numbers.size == 1

    "#{convert_hundreds(numbers)} #{type if type != :hundred}"
  end

  def convert_hundreds(numbers)
    hundreds = "#{NUMBER_TO_WORD[numbers.first]} hundred"
    tens = numbers[1..2].join

    "#{hundreds} #{convert_tens(tens)}".strip
  end

  class PrepareNumberGroups
    LEADING_ZEROES_REGEX = /\A0+/
    ENDING_ZEROES_REGEX = /00\z/

    class << self
      def call(numbers)
        number_groups = numbers.reverse.each_slice(3).map { |group| prepare_group(group) }

        [:hundred, :thousand, :million, :billion].
          zip(number_groups).to_h.compact.
          slice(:billion, :million, :thousand, :hundred)
      end

      private

      def prepare_group(numbers)
        numbers = numbers.reverse.join.sub(LEADING_ZEROES_REGEX, "").sub(ENDING_ZEROES_REGEX, "")

        return if numbers.empty?

        numbers.chars
      end
    end
  end
end
