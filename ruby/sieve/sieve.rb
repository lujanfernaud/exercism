class Sieve
  def initialize(max_number)
    @max_number = max_number
    @numbers    = [*2..max_number]
    @multiples  = []
    find_multiples
  end

  def primes
    @numbers - @multiples
  end

  def find_multiples
    2.upto(@max_number - 1) do |number1|
      next if @multiples.include?(number1)

      2.upto(@max_number) do |number2|
        multiple = number1 * number2
        break if multiple > @max_number
        @multiples << multiple unless @multiples.include?(multiple)
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
