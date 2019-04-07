# frozen_string_literal: true

class Robot
  attr_reader :bearing, :speed

  def initialize(bearing: :north, speed: 1, grid: Grid.new)
    @bearing = bearing
    @speed = speed
    @grid = grid
  end

  def orient(direction)
    raise ArgumentError unless grid.correct_direction?(direction)

    @bearing = direction
  end

  def turn_right
    @bearing = grid.find_direction(bearing, :right)
  end

  def turn_left
    @bearing = grid.find_direction(bearing, :left)
  end

  def at(*coordinates)
    grid.coordinates = coordinates
  end

  def advance
    grid.change_coordinate(bearing, speed)
  end

  def coordinates
    grid.coordinates
  end

  private

  attr_reader :grid
end
