# frozen_string_literal: true

class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def initialize(colors)
    @colors = [colors].flatten
    @coded_colors = @colors.map { |color| COLORS.index(color.downcase) }
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
    @invalid_color ||= colors - COLORS
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
    (10**coded_colors[2].to_i).to_s[1..-1]
  end

  def type
    value.length > 3 ? "kiloohms" : "ohms"
  end
end
