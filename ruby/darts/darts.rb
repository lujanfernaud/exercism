class Darts
  CIRCLE_TO_RANGE = {
    inner:  0.0..1.4,
    middle: 1.5..7.0,
    outer:  7.0..14.0
  }.freeze

  POINTS = {
    inner:  10,
    middle: 5,
    outer:  1
  }.freeze

  def initialize(*coordinates)
    @position = coordinates.map(&:abs).sum
  end

  def score
    case @position
    when CIRCLE_TO_RANGE[:inner]  then POINTS[:inner]
    when CIRCLE_TO_RANGE[:middle] then POINTS[:middle]
    when CIRCLE_TO_RANGE[:outer]  then POINTS[:outer]
    else 0
    end
  end
end
