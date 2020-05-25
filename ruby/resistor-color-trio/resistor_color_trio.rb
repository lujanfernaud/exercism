# frozen_string_literal: true

class ResistorColorTrio
  COLOR_TO_CODE = {
    "black"  => 0,
    "brown"  => 1,
    "red"    => 2,
    "orange" => 3,
    "yellow" => 4,
    "green"  => 5,
    "blue"   => 6,
    "violet" => 7,
    "grey"   => 8,
    "white"  => 9
  }.freeze

  def initialize(input_colors)
    @input_colors = input_colors
  end

  def label
    raise(*invalid_color_error) unless invalid_color.empty?

    "Resistor value: #{value_with_type}"
  end

  private

  attr_reader :input_colors

  def invalid_color_error
    [ArgumentError, "Not a valid color: #{invalid_color}"]
  end

  def invalid_color
    @invalid_color ||= input_colors - COLOR_TO_CODE.keys
  end

  def value_with_type
    value
      .sub(/0{9}$/, " giga")
      .sub(/0{6}$/, " mega")
      .sub(/0{3}$/, " kilo")
      .sub(/(\d)$/, "\\1 ") + "ohms"
  end

  def value
    (main_value * multiplier).to_s
  end

  def main_value
    coded_colors[0..1].join.to_i
  end

  def coded_colors
    @coded_colors ||= input_colors.map(&COLOR_TO_CODE)
  end

  def multiplier
    10**coded_colors[2]
  end
end
