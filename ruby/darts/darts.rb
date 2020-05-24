class Darts
  ABSOLUTE_SUM_TO_CIRCLE = {
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
    @coordinates = coordinates
  end

  def score
    case coordinates_sum
    when ABSOLUTE_SUM_TO_CIRCLE[:inner]  then POINTS[:inner]
    when ABSOLUTE_SUM_TO_CIRCLE[:middle] then POINTS[:middle]
    when ABSOLUTE_SUM_TO_CIRCLE[:outer]  then POINTS[:outer]
    when ABSOLUTE_SUM_TO_CIRCLE[:missed] then POINTS[:missed]
    end
  end

  private

  def coordinates_sum
    @coordinates.map(&:abs).sum
  end
end
