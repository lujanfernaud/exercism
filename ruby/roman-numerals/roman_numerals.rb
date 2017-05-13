class Fixnum
  ROMAN = { 1 => ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
            2 => ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
            3 => ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
            4 => ["", "M", "MM", "MMM"] }.freeze

  def to_roman
    numeral = to_s
    places  = [*numeral.length.downto(1)]

    numeral.chars.inject("") do |acc, number|
      acc + ROMAN[places.shift][number.to_i]
    end
  end
end

module BookKeeping
  VERSION = 2
end
