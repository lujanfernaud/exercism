# frozen_string_literal: true

require "pry"

class Matrix
  def initialize(values)
    @values = values
  end

  def rows
    matrix
  end

  def columns
    @columns ||= matrix.transpose
  end

  def saddle_points
    # binding.pry

    # ...

    # store row and columns index

    # row_max = row.max
    # column_max = column.max

    # return row and column index if row_max and column_max are the same number.
  end

  private

  attr_reader :values

  def matrix
    @matrix ||= values.each_line.map { |row| row.split.map(&:to_i) }
  end
end
