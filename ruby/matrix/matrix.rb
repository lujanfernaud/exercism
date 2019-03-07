class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def rows
    matrix.split("\n").map { |item| item.split.map(&:to_i) }
  end

  def columns
    [].tap do |columns|
      columns_number.times do |column_index|
        columns << items_in(column_index)
      end
    end
  end

  private

  def columns_number
    rows.map(&:length).max
  end

  def items_in(column_index)
    rows.each_with_object([]) do |row, column|
      column << row[column_index]
    end
  end

  attr_reader :matrix
end
