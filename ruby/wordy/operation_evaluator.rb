class OperationEvaluator
  def self.run(values)
    new(values).evaluate
  end

  def initialize(values)
    @values = values
    @result = 0
  end

  def evaluate
    until values.empty?
      first_item, second_item, third_item = values.slice!(0..2)

      result = if third_item
                 first_item.send(second_item, third_item)
               else
                 result.send(first_item, second_item)
               end
    end

    result
  end

  private

  attr_accessor :values, :result
end
