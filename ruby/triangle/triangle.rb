class Triangle
  def initialize(triangle)
    @triangle = triangle
  end

  def equilateral?
    valid? && sides_with_same_length == 1
  end

  def isosceles?
    valid? && (sides_with_same_length == 1 || sides_with_same_length == 2)
  end

  def scalene?
    valid? && !equilateral? && !isosceles?
  end

  private

  def valid?
    !unique_side_lengths.include?(0) && valid_proportions?
  end

  def unique_side_lengths
    @unique_side_lengths ||= triangle.uniq
  end

  def valid_proportions?
    sorted_side_lengths = triangle.max(3)
    longer_side = sorted_side_lengths.shift

    longer_side <= sorted_side_lengths.sum
  end

  def sides_with_same_length
    @sides_with_same_length ||= unique_side_lengths.size
  end

  attr_reader :triangle
end