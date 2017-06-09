module Prime
  def self.nth(number)
    raise ArgumentError, "0 is not a prime" if number.zero?

    primes    = [2]
    candidate = 3

    while number > primes.length
      primes.each do |prime|
        if prime > Math.sqrt(candidate)
          primes << candidate
          candidate += 2
          break
        elsif (candidate % prime).zero?
          candidate += 2
          break
        end
      end
    end

    primes.last
  end
end

module BookKeeping
  VERSION = 1
end
