class PigLatin
  VOWEL_SOUNDS_REGEX = %r{\A(xr|xt|yt|a|e|i|o|u)(.*)}

  CONSONANT_SOUNDS_REGEX = %r{
    \A(squ|thr|sch|ch|rh|qu|th|b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z)(.*)
  }x

  class << self
    def translate(input)
      input.split(" ").map(&method(:translate_word)).join(" ")
    end

    private

    def translate_word(word)
      return word + "ay" if word.match(VOWEL_SOUNDS_REGEX)

      match = word.match(CONSONANT_SOUNDS_REGEX)

      match[2] + match[1] + "ay"
    end
  end
end
