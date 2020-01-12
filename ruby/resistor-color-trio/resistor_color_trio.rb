# frozen_string_literal: true

require_relative "resistor_colors"

class ResistorColorTrio
  def initialize(colors)
    @colors = [colors].flatten
    @coded_colors = ResistorColors.coded(@colors)
  end

  def label
    raise(*invalid_color_error) unless invalid_color.empty?

    "Resistor value: #{stripped_value} #{type}"
  end

  private

  attr_reader :colors, :coded_colors

  def invalid_color_error
    [ArgumentError, "Not a valid color: #{invalid_color}"]
  end

  def invalid_color
    @invalid_color ||= colors - ResistorColors::COLORS
  end

  def stripped_value
    value.reverse.scan(/\d{1,3}/).reverse.shift.reverse
  end

  def value
    @value ||= "#{main_value}#{zeros}"
  end

  def main_value
    coded_colors[0..1].join
  end

  def zeros
    zeros = coded_colors[2]

    return unless zeros

    format("%0#{zeros}d", 0)
  end

  def type
    value.length > 3 ? "kiloohms" : "ohms"
  end
end
