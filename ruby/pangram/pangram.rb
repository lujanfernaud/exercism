class Pangram
  ALPHABET = ("a".."z").to_a

  def self.pangram?(sentence)
    ALPHABET.all? { |char| sentence.downcase.include?(char) }
  end
end

module BookKeeping
  VERSION = 4
end
