class PigLatin
  VOWEL_SOUNDS = /\A(xr|xt|yt|a|e|i|o|u)(.*)/
  CONSONANT_SOUNDS = /\A(squ|thr|sch|ch|rh|qu|th|b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z)(.*)/

  class << self
    def translate(input)
      input.split(" ").map { |word| translate_word(word) }.join(" ")
    end

    private

    def translate_word(word)
      if word.match(VOWEL_SOUNDS)
        word + "ay"
      elsif (match = word.match(CONSONANT_SOUNDS))
        match[2] + match[1] + "ay"
      end
    end
  end
end
