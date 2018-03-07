require "prime"

class PrimeFactors
  def self.for(number)
    return [] if number == 1

    prime_numbers = Prime.each(number)

    [].tap do |prime_factors|
      prime_numbers.each do |prime_number|
        result = number.to_f / prime_number

        while (result % 1).zero?
          prime_factors << prime_number
          result /= prime_number
        end
      end
    end
  end
end
