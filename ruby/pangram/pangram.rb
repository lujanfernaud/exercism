class Pangram
  ALPHABET = ("a".."z").to_a.freeze

  def self.pangram?(sentence)
    ALPHABET.all? { |char| sentence.downcase.include?(char) }
  end
end

module BookKeeping
  VERSION = 4
end
