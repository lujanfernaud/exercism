# frozen_string_literal: true

class ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  class << self
    def color_code(color)
      color_to_number[color]
    end

    private

    def color_to_number
      mappings = COLORS.map.with_index { |color, index| [color, index] }

      Hash[*mappings.flatten]
    end
  end
end
