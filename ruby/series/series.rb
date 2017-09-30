class Series
  def initialize(digits_string)
    @digits_string = digits_string.split("")
  end

  def slices(slice_length)
    raise ArgumentError, "Slice length can't be bigger than string length." if
      slice_length > @digits_string.length

    @digits_string.each_cons(slice_length).map { |substring| substring.join }
  end
end
