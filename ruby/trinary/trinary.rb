class Trinary
  VALID = /\A[0-2]+\z/

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 unless @trinary =~ VALID

    @trinary.reverse.each_char.with_index.sum do |number, index|
      number.to_i * 3**index
    end
  end
end

module BookKeeping
  VERSION = 1
end
