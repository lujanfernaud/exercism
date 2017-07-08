class Array
  def accumulate
    return enum_for(:accumulate) unless block_given?

    accumulator = []
    each { |value| accumulator << yield(value) }
    accumulator
  end
end

module BookKeeping
  VERSION = 1
end
