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
    @word = word.to_s
  end

  def score
    characters.map(&method(:to_score)).sum
  end

  private

  def characters
    word.upcase.scan(/\w/)
  end

  def to_score(character)
    SCORES.find { |_key, value| value.include?(character) }.first
  end

  attr_reader :word
end
