# frozen_string_literal: true

class Robot
  ADVANCE_POSITIONS = {
    north: 1,
    east: 1,
    south: -1,
    west: -1
  }.freeze

  attr_accessor :direction

  def initialize(direction: :north, grid: Grid.new)
    @direction = direction
    @grid = grid
  end

  def orient(direction)
    raise ArgumentError unless @grid.correct_direction?(direction)

    @direction = direction
  end

  def bearing
    direction
  end

  def turn_right
    @direction = @grid.find_direction(direction, :right)
  end

  def turn_left
    @direction = @grid.find_direction(direction, :left)
  end

  def at(*coordinates)
    @grid.coordinates = coordinates
  end

  def advance
    current_axis_value = @grid.send(axis)

    @grid.send("#{axis}=", current_axis_value + advance_positions)
  end

  def coordinates
    @grid.coordinates
  end

  private

  def axis
    @grid.axis_for(direction)
  end

  def advance_positions
    ADVANCE_POSITIONS[direction]
  end
end
