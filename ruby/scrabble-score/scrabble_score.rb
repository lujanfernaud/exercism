class Scrabble
  SCORES = {
    1  => %w[A E I O U L N R S T],
    2  => %w[D G],
    3  => %w[B C M P],
    4  => %w[F H V W Y],
    5  => %w[K],
    8  => %w[J X],
    10 => %w[Q Z]
  }

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word || ""
  end

  def score
    letters.sum(&method(:to_score))
  end

  private

  def letters
    @word.upcase.scan(/[A-Z]/)
  end

  def to_score(letter)
    SCORES.find { |_key, value| value.include?(letter) }.first
  end
end
