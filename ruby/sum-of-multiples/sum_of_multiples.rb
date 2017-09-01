class SumOfMultiples
  def initialize(*multiples_of)
    @multiples_of = multiples_of
  end

  def to(maximum)
    return 0 if maximum == 1 || @multiples_of.empty?

    sum_multiples_up_to(maximum - 1)
  end

  private

  def sum_multiples_up_to(maximum)
    @multiples_of.each_with_object [] do |number, memo|
      memo << find_multiples_of(number, maximum)
    end.flatten.uniq.inject(:+)
  end

  def find_multiples_of(number, maximum)
    maximum.downto(number).each_with_object [] do |num, memo|
      memo << num if (num % number).zero?
    end
  end
end

module BookKeeping
  VERSION = 1
end
