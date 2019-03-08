class Matrix
  def initialize(matrix)
    @matrix = matrix.each_line
  end

  def rows
    @rows ||= matrix.map(&individual_rows)
  end

  def columns
    rows.transpose
  end

  private

  def individual_rows
    proc { |item| item.split.map(&:to_i) }
  end

  attr_reader :matrix
end
