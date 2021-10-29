class HighScores
  TOP_THREE = 3

  def initialize(scores)
    @scores = scores
  end

  def scores
    @scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.sort.reverse.slice(0, TOP_THREE)
  end

  def latest_is_personal_best?
    latest >= personal_best
  end
end