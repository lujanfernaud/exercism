module Enumerable
  def keep
    [].tap do |array|
      to_a.each { |element| array << element if yield(element) }
    end
  end

  def discard
    [].tap do |array|
      to_a.each { |element| array << element unless yield(element) }
    end
  end
end
