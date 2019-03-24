module CharacterToScrabbleScore
  SCORES = {
    1  => %w[A E I O U L N R S T],
    2  => %w[D G],
    3  => %w[B C M P],
    4  => %w[F H V W Y],
    5  => %w[K],
    8  => %w[J X],
    10 => %w[Q Z]
  }

  refine String do
    def to_scrabble_score
      character = self[0].upcase

      SCORES.find { |_key, value| value.include?(character) }.first
    end
  end
end

class Scrabble
  using CharacterToScrabbleScore

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word.to_s
  end

  def score
    characters.sum(&:to_scrabble_score)
  end

  private

  def characters
    @word.scan(/\w/)
  end
end
