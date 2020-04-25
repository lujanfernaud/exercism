# frozen_string_literal: true

class PositionExtended
  DIRECTIONS = {
    north: {
      axis: :y,
      multiplier: 1,
      right: :north_east,
      left: :north_west
    },
    north_east: {
      right: :east,
      left: :north
    },
    east: {
      axis: :x,
      multiplier: 1,
      right: :south_east,
      left: :north_east
    },
    south_east: {
      right: :south,
      left: :east
    },
    south: {
      axis: :y,
      multiplier: -1,
      right: :south_west,
      left: :south_east
    },
    south_west: {
      right: :west,
      left: :south
    },
    west: {
      axis: :x,
      multiplier: -1,
      right: :north_west,
      left: :south_west
    },
    north_west: {
      right: :north,
      left: :west
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

  def change(direction, positions)
    directions = direction.to_s.split("_").map(&:to_sym)

    directions.each do |dir|
      change_coordinate(dir, positions)
    end
  end

  def correct_direction?(direction)
    DIRECTIONS.key?(direction)
  end

  def find_direction(direction, side)
    DIRECTIONS[direction][side]
  end

  private

  attr_accessor :x, :y

  def change_coordinate(direction, positions)
    axis = DIRECTIONS[direction][:axis]
    current_axis_value = send(axis)
    advance_positions = positions * DIRECTIONS[direction][:multiplier]

    send("#{axis}=", current_axis_value + advance_positions)
  end
end
