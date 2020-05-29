class PigLatin
  VOWEL_SOUNDS = /\A(xr|xt|yt|a|e|i|o|u)(.*)/
  CONSONANT_SOUNDS = /\A(squ|thr|sch|ch|rh|qu|th|b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z)(.*)/

  class << self
    def translate(input)
      input.split(" ").map { |word| translate_word(word) }.join(" ")
    end

    private

    def translate_word(word)
      word.then(&translate_vowels).then(&translate_consonants)
    end

    def translate_vowels
      lambda do |word|
        return word + "ay" if word.match(VOWEL_SOUNDS)

        word
      end
    end

    def translate_consonants
      lambda do |word|
        return word if word.end_with?("ay")

        match = word.match(CONSONANT_SOUNDS)

        return match[2] + match[1] + "ay" if match

        word
      end
    end
  end
end
