module Year
  def self.leap?(year)
    return true if (year % 4).zero? && !(year % 100).zero?

    (year % 400).zero?
  end
end

module BookKeeping
  VERSION = 3
end
