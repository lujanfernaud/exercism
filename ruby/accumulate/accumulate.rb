class Array
  def accumulate
    return enum_for(:accumulate) unless block_given?

    inject [] { |accumulator, value| accumulator << yield(value) }
  end
end

module BookKeeping
  VERSION = 1
end
