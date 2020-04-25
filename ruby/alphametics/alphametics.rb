require "pry"

class Alphametics
  SCORES = {
    "A" => 2,
    "B" => 9,
    "C" => 0,
    "D" => 0,
    "I" => 1,
    "L" => 0
  }

  def self.solve(puzzle)
    new(puzzle).solve
  end

  def initialize(puzzle)
    @puzzle = puzzle
    @characters = puzzle.scan(/\w/).uniq.sort
    @alphametic = false
  end

  def solve
    compute_puzzle

    alphametic ? character_scores : {}
  end

  private

  def compute_puzzle
    parsed_scores = puzzle.chars.map { |item| SCORES[item] || item }.join

    @alphametic = eval(parsed_scores)
  rescue SyntaxError
    binding.pry
  end

  def character_scores
    SCORES.select { |key, _value| characters.include?(key) }
  end

  attr_reader :puzzle, :characters, :alphametic
end
