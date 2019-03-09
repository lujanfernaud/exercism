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

    parse_result
  end

  private

  def operation_is_not_valid?
    # Find a better way to do this.
    @question = @question.join(" ") if @question.class == Array

    !@question.match(/\d.+?\d/)
  end

  def parse_result
    parse_question_to_values

    while !@values.empty? do
      first_number, operand, second_number = @values.slice!(0..2)

      if second_number
        @result = first_number.send(operand, second_number)
      else
        @result = @result.send(first_number, operand)
      end
    end

    @result
  end

  def parse_question_to_values
    prepare_question
    parse_values
  end

  def prepare_question
    @question = @question.sub("What is ", "").gsub("by", "").sub("?", "")
    @question = @question.split(" ")
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

