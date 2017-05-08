class Raindrops
  FACTORS = { 3 => "Pling",
              5 => "Plang",
              7 => "Plong" }.freeze

  def self.convert(number)
    result = ""

    FACTORS.each_key do |factor|
      result << FACTORS[factor] if (number % factor).zero?
    end

    result.empty? ? number.to_s : result
  end
end

module BookKeeping
  VERSION = 3
end
