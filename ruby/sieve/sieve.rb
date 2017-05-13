class Sieve
  def initialize(max_number)
    @numbers = [*2..max_number]
  end

  def primes
    @numbers.each do |num1|
      @numbers.delete_if { |num2| num2 != num1 && (num2 % num1).zero? }
    end
  end
end

module BookKeeping
  VERSION = 1
end
