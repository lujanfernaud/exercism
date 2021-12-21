class Simulator
  INSTRUCTION = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }.freeze

  # Move the robot according to the incoming instructions.
  #
  # @param robot [Robot]
  # @param incoming_instructions [String] Example: "RALAL"
  #
  # @return [Array<Symbol>] Translated instructions that were applied.
  def evaluate(robot, incoming_instructions)
    instructions(incoming_instructions).each(&robot.method(:send))
  end

  # Translate the incoming instructions.
  #
  # @param incoming_instructions [String] Example: "RALAL"
  #
  # @return [Array<Symbol>] Translated instructions.
  #
  # @example
  #   > instructions("RALAL")
  #   #=> [:turn_right, :advance, :turn_left, :advance, :turn_left]
  def instructions(incoming_instructions)
    incoming_instructions.chars.map(&INSTRUCTION)
  end

  # @param robot [Robot]
  # @param x [Integer]
  # @param y [Integer]
  # @param direction [Symbol] Example: :right
  #
  # @return [Symbol] New bearing. Example: :east
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end
end
