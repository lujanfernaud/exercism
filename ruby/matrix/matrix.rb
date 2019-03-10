class Matrix
  def initialize(matrix)
    @matrix = matrix.each_line
  end

  def rows
    @rows ||= @matrix.map { |item| item.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end
end
