class Darts
  CIRCLE_TO_ABSOLUTE_SUM_RANGE = {
    inner: 0.0..1.4,
    middle: 1.5..7.0,
    outer: 7.0..14.0,
    missed: 14.0..99.0
  }.freeze

  POINTS = {
    inner: 10,
    middle: 5,
    outer: 1,
    missed: 0
  }.freeze

  def initialize(*coordinates)
    @absolute_sum = coordinates.map(&:abs).sum
  end

  def score
    case @absolute_sum
    when CIRCLE_TO_ABSOLUTE_SUM_RANGE[:inner]  then POINTS[:inner]
    when CIRCLE_TO_ABSOLUTE_SUM_RANGE[:middle] then POINTS[:middle]
    when CIRCLE_TO_ABSOLUTE_SUM_RANGE[:outer]  then POINTS[:outer]
    when CIRCLE_TO_ABSOLUTE_SUM_RANGE[:missed] then POINTS[:missed]
    end
  end
end
