# frozen_string_literal: true

require "forwardable"

class Robot
  extend Forwardable

  ADVANCE_POSITIONS = {
    north: 1,
    east: 1,
    south: -1,
    west: -1
  }.freeze

  attr_accessor :direction

  def_delegators :@grid, :coordinates

  def initialize(direction: :north, grid: Grid.new)
    @direction = direction
    @grid = grid
  end

  def orient(direction)
    raise ArgumentError unless Grid::DIRECTIONS.key?(direction)

    @direction = direction
  end

  def bearing
    direction
  end

  def turn_right
    @direction = Grid::DIRECTIONS[direction][:right]
  end

  def turn_left
    @direction = Grid::DIRECTIONS[direction][:left]
  end

  def at(*coordinates)
    @grid.coordinates = coordinates
  end

  def advance
    current_axis_value = @grid.send(axis)

    @grid.send("#{axis}=", current_axis_value + advance_positions)
  end

  private

  def axis
    Grid::DIRECTIONS[direction][:axis]
  end

  def advance_positions
    ADVANCE_POSITIONS[direction]
  end
end

class Grid
  DIRECTIONS = {
    north: {
      axis: :y,
      right: :east,
      left: :west
    },
    east: {
      axis: :x,
      right: :south,
      left: :north
    },
    south: {
      axis: :y,
      right: :west,
      left: :east
    },
    west: {
      axis: :x,
      right: :north,
      left: :south
    }
  }.freeze

  attr_accessor :x, :y

  def initialize(x: 0, y: 0)
    @x = x.to_i
    @y = y.to_i
  end

  def coordinates
    [x, y]
  end

  def coordinates=(args)
    @x = args[0].to_i
    @y = args[1].to_i
  end
end

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
