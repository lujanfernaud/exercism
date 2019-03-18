class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select { |candidate| anagram?(candidate) }
  end

  private

  def anagram?(candidate)
    !candidate.casecmp(word).zero? && chars_for(candidate) == chars_for(word)
  end

  def chars_for(word)
    word.downcase.chars.sort
  end

  attr_reader :word
end
