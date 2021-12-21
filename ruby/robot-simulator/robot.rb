require_relative "robot/position"

class Robot
  # @param bearing [Symbol]
  # @param position [Position]
  def initialize(bearing: :north, position: Position.new)
    @bearing = bearing
    @position = position
  end

  attr_reader :bearing

  # It sets the bearing if it's valid.
  #
  # @param bearing [Symbol] Example: :north
  #
  # @raise [Robot::Position::InvalidBearingError]
  #
  # @return [Symbol] Bearing.
  def orient(bearing)
    position.check_bearing!(bearing)

    @bearing = bearing
  end

  # @return [Symbol] New bearing.
  def turn_right
    @bearing = turn(:right)
  end

  # @return [Symbol] New bearing.
  def turn_left
    @bearing = turn(:left)
  end

  # It places the robot at the specified coordinates.
  #
  # @param coordinates [Array<Integer>] Example: [0, 1]
  #
  # @return [Array<Integer>] Coordinates.
  def at(*coordinates)
    position.coordinates = coordinates
  end

  # @return [Array<Integer>] New coordinates. Example: [0, 2]
  def advance
    position.move(bearing)
  end

  # @return [Array<Integer>] Example: [0, 1]
  def coordinates
    position.coordinates
  end

  private

  attr_reader :position

  # @param direction [Symbol] Example: :right
  #
  # @return [Symbol] New bearing. Example: :east
  def turn(direction)
    position.find_new_bearing(bearing, direction)
  end
end
