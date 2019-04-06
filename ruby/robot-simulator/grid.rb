# frozen_string_literal: true

class Grid
  DIRECTIONS = {
    north: {
      axis: :y,
      right: :east,
      left: :west
    },
    east: {
      axis: :x,
      right: :south,
      left: :north
    },
    south: {
      axis: :y,
      right: :west,
      left: :east
    },
    west: {
      axis: :x,
      right: :north,
      left: :south
    }
  }.freeze

  attr_accessor :x, :y

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

  def correct_direction?(direction)
    DIRECTIONS.key?(direction)
  end

  def find_direction(direction, side)
    DIRECTIONS[direction][side]
  end

  def axis_for(direction)
    DIRECTIONS[direction][:axis]
  end
end
