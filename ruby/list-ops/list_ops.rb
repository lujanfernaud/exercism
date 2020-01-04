# frozen_string_literal: true

class ListOps
  class << self
    def arrays(input)
      size = 0

      input.each { |_item| size += 1 }

      size
    end

    def reverser(input)
      [].tap do |result|
        input.each { |item| result.unshift(item) }
      end
    end

    def concatter(input1, input2)
      result = input1.dup

      input2.each { |item| result << item }

      result
    end

    def mapper(input, &block)
      [].tap do |result|
        input.each { |item| result << block.call(item) }
      end
    end

    def filterer(input, &block)
      [].tap do |result|
        input.each { |item| result << item if block.call(item) }
      end
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
