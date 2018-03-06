# I'm not a big fan of math problems.
# This solution is very slow for the last two test cases, but works.

class PrimeFactors
  def self.for(number)
    return [] if number == 1

    divisors = [*2..number]

    [].tap do |prime_factors|
      divisors.each do |divisor|
        next unless self.is_prime?(divisor)

        result = number.to_f / divisor

        while (result % 1).zero?
          prime_factors << divisor
          result /= divisor
        end

        break if result < 1.0
      end
    end
  end

  def self.is_prime?(number)
    max = Math.sqrt(number)

    [*2..max].none? { |n| (number % n).zero? }
  end
end
