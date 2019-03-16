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
    array.each do |value|
      next if value.nil?

      if value.is_a?(Array)
        extract_values_from(value)
      else
        @new_array << value
      end
    end
  end

  attr_reader :array, :new_array
end