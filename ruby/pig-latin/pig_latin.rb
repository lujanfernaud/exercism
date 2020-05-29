class PigLatin
  VOWEL_SOUNDS_REGEX = /\A(xr|xt|yt|a|e|i|o|u)(.*)/.freeze

  CONSONANT_SOUNDS_REGEX = /
    \A(squ|thr|sch|ch|rh|qu|th|b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z)(.*)
  /x.freeze

  class << self
    def translate(sentence)
      sentence.split.map(&method(:translate_word)).join(" ")
    end

    private

    def translate_word(word)
      return word + "ay" if word.match(VOWEL_SOUNDS_REGEX)

      _word, consonant_sound, rest = word.match(CONSONANT_SOUNDS_REGEX).to_a

      rest + consonant_sound + "ay"
    end
  end
end
