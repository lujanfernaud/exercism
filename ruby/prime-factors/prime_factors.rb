# I'm not a big fan of math problems.
# This solution is very slow for the last two test cases, but works.

class PrimeFactors
  def self.for(number)
    new(number).find_prime_factors
  end

  def initialize(number)
    @number        = number
    @divisors      = [*2..number]
    @prime_factors = []
  end

  def find_prime_factors
    return [] if @number == 1

    @divisors.each do |divisor|
      next unless is_prime?(divisor)

      @result = @number.to_f / divisor

      while (@result % 1).zero?
        @prime_factors << divisor
        @result /= divisor
      end

      break if @result < 1.0
    end

    @prime_factors
  end

  def is_prime?(number)
    max = Math.sqrt(number)

    [*2..max].none? { |n| (number % n).zero? }
  end
end
