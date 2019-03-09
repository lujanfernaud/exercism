require "pry"

OPERATORS = {
  "plus"       => "+",
  "minus"      => "-",
  "multiplied" => "*",
  "divided"    => "/"
}.freeze

class WordProblem
  def initialize(question)
    @question = question
    @values   = []
    @result   = 0
  end

  def answer
    raise ArgumentError, "Unknown operation" if operation_is_not_valid?

    parse
  end

  private

  def operation_is_not_valid?
    !@question.match(/\d.+?\d/)
  end

  def parse
    @question = @question.sub("What is ", "").gsub("by", "").sub("?", "")
    @question = @question.split(" ")

    parse_values

    while !@values.empty? do
      v = @values.slice!(0..2)
      first_number, operand, second_number = v

      if second_number
        @result = first_number.send(operand, second_number)
      else
        @result = @result.send(first_number, operand)
      end
    end

    @result
  end

  def parse_values
    @values = @question.map do |value|
      if OPERATORS.include?(value)
        OPERATORS[value].to_sym
      else
        value.to_i
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
