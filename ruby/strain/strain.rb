module Enumerable
  def keep
    return to_enum unless block_given?

    to_a.each_with_object [] { |item, array| array << item if yield item }
  end

  def discard
    keep { |element| !yield element }
  end
end
