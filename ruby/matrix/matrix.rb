class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def rows
    @rows ||= @matrix.each_line.map { |item| item.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end
end
