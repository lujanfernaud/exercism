require_relative "robot/position"

class Robot
  # @param bearing [Symbol]
  # @param position [Position]
  def initialize(bearing: :north, position: Position.new)
    @bearing = bearing
    @position = position
  end

  attr_reader :bearing

  # @param bearing [Symbol]
  #
  # @raise [InvalidBearingError]
  def orient(bearing)
    position.check_bearing!(bearing)

    @bearing = bearing
  end

  def turn_right
    @bearing = turn(:right)
  end

  def turn_left
    @bearing = turn(:left)
  end

  # @param coordinates [Array<Integer>] Example: [0, 1]
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

  # @param direction [Symbol]
  #
  # @return [Symbol]
  def turn(direction)
    position.find_new_bearing(bearing, direction)
  end
end
