# frozen_string_literal: true

class Robot
  attr_accessor :direction
  attr_reader :speed

  def initialize(direction: :north, speed: 1, grid: Grid.new)
    @direction = direction
    @speed = speed
    @grid = grid
  end

  def orient(direction)
    raise ArgumentError unless grid.correct_direction?(direction)

    @direction = direction
  end

  def bearing
    direction
  end

  def turn_right
    @direction = grid.find_direction(direction, :right)
  end

  def turn_left
    @direction = grid.find_direction(direction, :left)
  end

  def at(*coordinates)
    grid.coordinates = coordinates
  end

  def advance
    grid.change_coordinate(direction, speed)
  end

  def coordinates
    grid.coordinates
  end

  private

  attr_reader :grid
end
