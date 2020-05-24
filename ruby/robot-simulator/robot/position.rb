# frozen_string_literal: true

class Robot
  class Position
    DIRECTIONS = {
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
    }.freeze

    def initialize(x: 0, y: 0)
      @x = x.to_i
      @y = y.to_i
    end

    def coordinates
      [x, y]
    end

    def coordinates=(args)
      @x = args[0].to_i
      @y = args[1].to_i
    end

    def move(bearing)
      move = DIRECTIONS[bearing][:move]

      self.coordinates = coordinates.zip(move).map(&:sum)
    end

    def valid_direction?(bearing)
      DIRECTIONS.key?(bearing)
    end

    def find_direction(bearing, direction)
      DIRECTIONS[bearing][direction]
    end

    private

    attr_accessor :x, :y
  end
end
