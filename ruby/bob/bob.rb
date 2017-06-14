class Bob
  class << self
    def hey(remark)
      case remark.strip
      when yelling? then "Whoa, chill out!"
      when asking?  then "Sure."
      when silence? then "Fine. Be that way!"
      else "Whatever."
      end
    end

    def yelling?
      lambda do |remark|
        letters = remark.scan(/[^1-9|\W]/)
        return false if letters.empty?

        letters.all? { |letter| letter == letter.upcase }
      end
    end

    def asking?
      ->(remark) { remark.end_with?("?") }
    end

    def silence?
      ->(remark) { remark.empty? }
    end
  end
end

module BookKeeping
  VERSION = 1
end
