class Acronym
  FIRST_CHARACTER_OF_WORD = /\b\w/

  def self.abbreviate(sentence)
    sentence.scan(FIRST_CHARACTER_OF_WORD).join.upcase
  end
end
