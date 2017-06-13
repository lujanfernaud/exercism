class Grains
  class << self
    CHESSBOARD = (1..64)
    CHESSBOARD_SQUARES = 64
    GRAINS_MULTIPLIER = 2
    OFFSET = 1

    def on_square(square_number)
      not_a_chessboard_square unless CHESSBOARD.cover?(square_number)

      GRAINS_MULTIPLIER**(square_number - OFFSET)
    end

    def total
      GRAINS_MULTIPLIER**CHESSBOARD_SQUARES - OFFSET
    end

    def not_a_chessboard_square
      raise ArgumentError, "Square number must be between 1 and 64"
    end

    alias square on_square
  end
end

module BookKeeping
  VERSION = 1
end
