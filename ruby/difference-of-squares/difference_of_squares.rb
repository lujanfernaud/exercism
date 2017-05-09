class Squares
  attr_reader :number, :numbers

  def initialize(number)
    @number  = number
    @numbers = (1..number).to_a
  end

  def square_of_sum
    return 0 if number.zero?
    numbers.inject(:+)**2
  end

  def sum_of_squares
    return 0 if number.zero?
    numbers.map { |n| n**2 }.inject(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
