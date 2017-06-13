class Phrase
  attr_reader :phrase

  REGEXP = /\w+$|\w+\'\w+|\w+/

  def initialize(phrase)
    @phrase = phrase.scan(REGEXP).group_by(&:downcase)
  end

  def word_count
    phrase.each { |word, instances| phrase[word] = instances.length }
  end
end

module BookKeeping
  VERSION = 1
end
