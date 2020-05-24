# frozen_string_literal: true

require_relative "robot/position"

class Robot
  attr_reader :bearing

  def initialize(bearing: :north, position: Position.new)
    @bearing = bearing
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
    position.move(bearing)
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
