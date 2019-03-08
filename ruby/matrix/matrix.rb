class Matrix
  def initialize(matrix)
    @matrix = matrix.each_line
  end

  def rows
    @rows ||= matrix.map(&method(:individual_rows))
  end

  def columns
    rows.transpose
  end

  private

  def individual_rows(item)
    item.split.map(&:to_i)
  end

  attr_reader :matrix
end
