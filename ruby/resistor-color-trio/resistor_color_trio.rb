# frozen_string_literal: true

class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def initialize(colors)
    @colors = [colors].flatten
  end

  def label
    raise(*invalid_color_error) unless invalid_color.empty?

    "Resistor value: #{value_with_type}"
  end

  private

  attr_reader :colors

  def invalid_color_error
    [ArgumentError, "Not a valid color: #{invalid_color}"]
  end

  def invalid_color
    @invalid_color ||= colors - COLORS
  end

  def value_with_type
    value
      .sub(/0{9}$/, " giga")
      .sub(/0{6}$/, " mega")
      .sub(/0{3}$/, " kilo")
      .sub(/(\d)$/, "\\1 ") + "ohms"
  end

  def value
    @value ||= (coded_colors[0..1].join.to_i * 10**coded_colors[2].to_i).to_s
  end

  def coded_colors
    @coded_colors ||= colors.map { |color| COLORS.index(color.downcase) }
  end
end
