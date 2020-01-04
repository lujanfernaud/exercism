# frozen_string_literal: true

class ListOps
  class << self
    def arrays(input)
      result = 0

      input.each { |_item| result += 1 }

      result
    end

    def reverser(input)
      result = []

      input.each { |item| result.unshift(item) }

      result
    end

    def concatter(input1, input2)
      result = input1.dup

      input2.each { |item| result << item }

      result
    end

    def mapper(input, &block)
      result = []

      input.each { |item| result << block.call(item) }

      result
    end

    def filterer(input, &block)
      result = []

      input.each { |item| result << item if block.call(item) }

      result
    end

    def sum_reducer(input)
      result = 0

      input.each { |item| result += item }

      result
    end

    def factorial_reducer(input)
      result = 1

      input.each { |item| result *= item }

      result
    end
  end
end
