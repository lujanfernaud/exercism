# frozen_string_literal: true

# Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
# `resistor_color_duo_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/resistor-color-duo` directory.

module ResistorColorDuo
  COLOR_CODES = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }.freeze

  def self.value(colors)
    # [colors[0], colors[1]].map { |color| COLOR_CODES[color] }.join.to_i

    require "pry"
    binding.pry

    colors.first(2).map { |color| COLOR_CODES[color] }.join.to_i
  end
end
