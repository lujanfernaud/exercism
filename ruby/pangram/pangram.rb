class Pangram
  ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t v w x y z].freeze

  def self.pangram?(sentence)
    ALPHABET.all? { |char| sentence.downcase.chars.include?(char) }
  end
end

module BookKeeping
  VERSION = 4
end
