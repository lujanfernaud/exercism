# frozen_string_literal: true

class Simulator
  INSTRUCTIONS = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }.freeze

  def instructions(instructions)
    instructions.chars.map(&INSTRUCTIONS)
  end

  def place(robot, args)
    robot.at(args[:x], args[:y])
    robot.orient(args[:direction])
  end

  def evaluate(robot, instructions)
    instructions(instructions).each(&robot.method(:send))
  end
end
