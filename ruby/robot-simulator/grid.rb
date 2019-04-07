# frozen_string_literal: true

class Grid
  DIRECTIONS = {
    north: {
      axis: :y,
      multiplier: 1,
      right: :east,
      left: :west
    },
    east: {
      axis: :x,
      multiplier: 1,
      right: :south,
      left: :north
    },
    south: {
      axis: :y,
      multiplier: -1,
      right: :west,
      left: :east
    },
    west: {
      axis: :x,
      multiplier: -1,
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

  def change_coordinate(direction, positions)
    axis = DIRECTIONS[direction][:axis]
    current_axis_value = send(axis)
    advance_positions = positions * DIRECTIONS[direction][:multiplier]

    send("#{axis}=", current_axis_value + advance_positions)
  end

  def correct_direction?(direction)
    DIRECTIONS.key?(direction)
  end

  def find_direction(direction, side)
    DIRECTIONS[direction][side]
  end

  private

  attr_accessor :x, :y
end
