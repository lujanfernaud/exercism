class Squares
  def initialize(max_number)
    @numbers = 0.upto(max_number)
  end

  def square_of_sum
    @numbers.inject(:+)**2
  end

  def sum_of_squares
    @numbers.map { |n| n**2 }.inject(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
