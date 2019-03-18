class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select do |candidate|
      next if candidate.casecmp(word).zero?

      candidate if candidate.downcase.chars.sort == sorted_characters
    end
  end

  private

  def sorted_characters
    word.downcase.chars.sort
  end

  attr_reader :word
end
