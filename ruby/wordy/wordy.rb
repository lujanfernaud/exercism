require "./question_parser"
require "./operation_evaluator"

class WordProblem
  OPERATION = /\d.+?\d/

  def initialize(question)
    @question = question
  end

  def answer
    raise ArgumentError, "Unknown operation" unless question.match(OPERATION)

    evaluate_problem
  end

  private

  def evaluate_problem
    values = QuestionParser.run(question)
    OperationEvaluator.run(values)
  end

  attr_reader :question
end
