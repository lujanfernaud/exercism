class Trinary
  VALID = /\A[0-2]+\z/

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 unless @trinary =~ VALID

    convert_trinary_string_to_integers_array
    convert_to_decimal
  end

  private

  def convert_trinary_string_to_integers_array
    @trinary = @trinary.split("").map(&:to_i)
  end

  def convert_to_decimal
    length = @trinary.length - 1

    @trinary.map.with_index do |number, index|
      position = length - index

      number * 3**position
    end.sum
  end
end

module BookKeeping
  VERSION = 1
end
