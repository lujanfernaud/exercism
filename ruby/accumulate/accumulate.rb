class Array
  def accumulate
    return to_enum unless block_given?

    accumulator = []
    each { |value| accumulator << yield(value) }
    accumulator
  end
end

module BookKeeping
  VERSION = 1
end
