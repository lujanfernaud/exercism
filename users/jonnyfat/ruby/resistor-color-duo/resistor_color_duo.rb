class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  def self.value(color_list)
    result = 0



    require 'pry'
    binding.pry


    color_list.first(2).map { |color| COLORS.index(color) }.each do |color_value|
      result = result * 10 + color_value
    end

    result
  end
end
