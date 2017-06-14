class Bob
  class << self
    def hey(remark)
      return "Whoa, chill out!"   if yelling?(remark)
      return "Sure."              if asking?(remark)
      return "Fine. Be that way!" if silence?(remark)

      "Whatever."
    end

    def yelling?(remark)
      letters = remark.scan(/[^1-9|\W]/)
      return false if letters.empty?

      letters.all? { |letter| letter == letter.upcase }
    end

    def asking?(remark)
      remark.strip.end_with?("?")
    end

    def silence?(remark)
      remark.strip.empty?
    end
  end
end

module BookKeeping
  VERSION = 1
end
