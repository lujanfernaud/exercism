class Robot
  class Position
    BEARINGS = {
      north: {
        move: [0, 1],
        right: :east,
        left: :west
      },
      east: {
        move: [1, 0],
        right: :south,
        left: :north
      },
      south: {
        move: [0, -1],
        right: :west,
        left: :east
      },
      west: {
        move: [-1, 0],
        right: :north,
        left: :south
      }
    }

    # @param x [Integer]
    # @param y [Integer]
    def initialize(x: 0, y: 0)
      @x = Integer(x)
      @y = Integer(y)
    end

    # @return [Array<Integer>] Example: [0, 1]
    def coordinates
      [@x, @y]
    end

    # @param coordinates [Array<Integer>] Example: [0, 1]
    #
    # @return [Array<Integer>] Coordinates.
    def coordinates=(coordinates)
      @x, @y = coordinates.take(2).map(&:to_i)
    end

    # @param bearing [Symbol] Example: :north
    #
    # @return [Array<Integer>] New coordinates. Example: [0, 2]
    def move(bearing)
      move = BEARINGS[bearing][:move]

      self.coordinates = coordinates.zip(move).map(&:sum)
    end

    # @param bearing [Symbol] Example: :north
    #
    # @raise [InvalidBearingError]
    def check_bearing!(bearing)
      raise InvalidBearingError.new(bearing) unless BEARINGS.key?(bearing)
    end

    # @param bearing [Symbol] Example: :east
    # @param direction [Symbol] Example: :right
    #
    # @return [Symbol] New bearing.
    #
    # @example
    #   > find_new_bearing(:east, :right)
    #   #=> :south
    def find_new_bearing(bearing, direction)
      BEARINGS[bearing][direction]
    end

    class InvalidBearingError < ArgumentError
      # @param bearing [Symbol]
      def initialize(bearing)
        super(":#{bearing} is not a valid bearing. Valid bearings: #{BEARINGS.keys}")
      end
    end
  end
end
