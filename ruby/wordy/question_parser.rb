class QuestionParser
  OPERATORS = {
    "plus"       => "+",
    "minus"      => "-",
    "multiplied" => "*",
    "divided"    => "/"
  }.freeze

  def self.run(question)
    new(question).parse
  end

  def initialize(question)
    @question = question
  end

  def parse
    prepare_question
    parse_values
  end

  private

  def prepare_question
    @question = question.sub("What is ", "").gsub("by", "").chop.split(" ")
  end

  def parse_values
    question.map do |value|
      if OPERATORS.include?(value)
        OPERATORS[value].to_sym
      else
        value.to_i
      end
    end
  end

  attr_reader :question
end

