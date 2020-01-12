# frozen_string_literal: true

module ResistorColors
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  class << self
    def coded(colors)
      selected(colors).map(&method(:color_code))
    end

    private

    def selected(colors)
      last_color = colors.last(1).keep_if { |color| color != "black" }

      colors[0..1] + last_color
    end

    def color_code(color)
      COLORS.index(color.downcase)
    end
  end
end
