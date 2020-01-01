# frozen_string_literal: true

class Simulator
  OP_TO_INSTRUCTION = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }.freeze

  def evaluate(robot, incoming_instructions)
    instructions(incoming_instructions).each(&robot.method(:send))
  end

  def instructions(incoming_instructions)
    incoming_instructions.chars.map(&OP_TO_INSTRUCTION)
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end
end
