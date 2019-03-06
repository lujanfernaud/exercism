class Series
  def initialize(digits)
    @digits = digits.chars
  end

  def slices(slice_length)
    raise ArgumentError, "Slice length can't be bigger than string length." if
      slice_length > @digits.length

    @digits.each_cons(slice_length).map(&:join)
  end
end