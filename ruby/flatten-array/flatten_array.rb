class FlattenArray
  def self.flatten(array)
    new(array).call
  end

  def initialize(array)
    @array = array
    @new_array = []
  end

  def call
    extract_values_from(array)
    new_array
  end

  private

  def extract_values_from(array)
    array.each do |item|
      next if item.nil?

      if item.is_a?(Array)
        extract_values_from(item)
      else
        @new_array << item
      end
    end
  end

  attr_reader :array, :new_array
end