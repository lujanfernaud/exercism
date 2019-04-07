# frozen_string_literal: true

class Robot
  attr_reader :bearing, :speed

  def initialize(bearing: :north, speed: 1, position: Position.new)
    @bearing = bearing
    @speed = speed
    @position = position
  end

  def orient(direction)
    raise ArgumentError unless position.correct_direction?(direction)

    @bearing = direction
  end

  def turn_right
    @bearing = position.find_direction(bearing, :right)
  end

  def turn_left
    @bearing = position.find_direction(bearing, :left)
  end

  def at(*coordinates)
    position.coordinates = coordinates
  end

  def advance
    position.change(bearing, speed)
  end

  def coordinates
    position.coordinates
  end

  private

  attr_reader :position
end
