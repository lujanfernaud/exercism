# frozen_string_literal: true

class ListOps
  class << self
    def arrays(input)
      result = 0

      to_array(input).each { result += 1 }

      result
    end

    def reverser(input)
      result = []

      to_array(input).each { |item| result.unshift(item) }

      result
    end

    def concatter(input1, input2)
      result = to_array(input1).dup

      to_array(input2).each { |item| result << item }

      result
    end

    def mapper(input, &block)
      result = []

      to_array(input).each { |item| result << block.call(item) }

      result
    end

    def filterer(input, &block)
      result = []

      to_array(input).each { |item| result << item if block.call(item) }

      result
    end

    def sum_reducer(input)
      result = 0

      to_array(input).each { |item| result += item }

      result
    end

    def factorial_reducer(input)
      result = 1

      to_array(input).each { |item| result *= item }

      result
    end

    private

    def to_array(input)
      [input].flatten
    end
  end
end
