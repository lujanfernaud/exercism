class Triangle
  def initialize(triangle)
    @triangle = triangle
  end

  def equilateral?
    return false if unique_side_lengths.first.zero?

    sides_with_same_length == 1
  end

  def isosceles?
    return false if unique_side_lengths.include?(1)

    sides_with_same_length == 1 || sides_with_same_length == 2
  end

  def scalene?
    sorted_side_lengths = triangle.max(3)
    longer_side = sorted_side_lengths.shift

    longer_side <= sorted_side_lengths.sum && !equilateral? && !isosceles?
  end

  private

  def sides_with_same_length
    unique_side_lengths.size
  end

  def unique_side_lengths
    @unique_side_lengths ||= @triangle.uniq
  end

  attr_reader :triangle
end