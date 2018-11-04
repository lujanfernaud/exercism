class Acronym
  FIRST_CHARACTER_OF_WORD = /\b\w/.freeze

  def self.abbreviate(sentence)
    sentence.scan(FIRST_CHARACTER_OF_WORD).join.upcase
  end
end
