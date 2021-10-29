class Simulator
  INPUT_TO_INSTRUCTION = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }.freeze

  # @param robot [Robot]
  # @param incoming_instructions [String] Example: "RALAL"
  def evaluate(robot, incoming_instructions)
    instructions(incoming_instructions).each(&robot.method(:send))
  end

  # @param incoming_instructions [String] Example: "RALAL"
  #
  # @example
  #   > instructions("RALAL")
  #   #=> [:turn_right, :advance, :turn_left, :advance, :turn_left]
  def instructions(incoming_instructions)
    incoming_instructions.chars.map(&INPUT_TO_INSTRUCTION)
  end

  # @param robot [Robot]
  # @param x [Integer]
  # @param y [Integer]
  # @param direction [Symbol]
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end
end
