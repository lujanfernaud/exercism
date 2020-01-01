# frozen_string_literal: true

class Position
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

  def move(bearing, speed)
    axis = DIRECTIONS[bearing][:axis]
    current_axis_value = send(axis)
    advance_positions = speed * DIRECTIONS[bearing][:multiplier]

    send("#{axis}=", current_axis_value + advance_positions)
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
