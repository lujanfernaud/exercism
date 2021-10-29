class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(length)
    raise ArgumentError if length > string.length

    require 'pry'
    binding.pry

    string.chars.each_cons(length).map(&:join)
  end
end
