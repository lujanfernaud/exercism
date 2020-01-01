# frozen_string_literal: true

class Robot
  attr_reader :bearing, :speed

  def initialize(bearing: :north, speed: 1, position: Position.new)
    @bearing = bearing
    @speed = speed
    @position = position
  end

  def orient(bearing)
    raise ArgumentError unless position.valid_direction?(bearing)

    @bearing = bearing
  end

  def turn_right
    @bearing = turn(:right)
  end

  def turn_left
    @bearing = turn(:left)
  end

  def at(*coordinates)
    position.coordinates = coordinates
  end

  def advance
    position.move(bearing, speed)
  end

  def coordinates
    position.coordinates
  end

  private

  attr_reader :position

  def turn(direction)
    position.find_direction(bearing, direction)
  end
end
