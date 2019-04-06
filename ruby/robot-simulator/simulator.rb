# frozen_string_literal: true

class Simulator
  INSTRUCTIONS = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }.freeze

  def instructions(instructions)
    instructions.split("").map do |instruction|
      INSTRUCTIONS[instruction]
    end
  end

  def place(robot, args)
    robot.at(args[:x], args[:y])
    robot.direction = args[:direction]
  end

  def evaluate(robot, instructions)
    instructions(instructions).each do |instruction|
      robot.send(instruction)
    end
  end
end
