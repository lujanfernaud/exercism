class PigLatin
  VOWEL_SOUNDS_REGEX = /\A(xr|xt|yt|a|e|i|o|u)/.freeze

  CONSONANT_SOUNDS_REGEX = /
    (?<consonant>squ|thr|sch|ch|rh|qu|th|b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z)
    (?<rest>.*)
  /x.freeze

  class << self
    def translate(sentence)
      sentence.split.map { |word| translate_word(word) }.join(" ")
    end

    private

    def translate_word(word)
      return "#{word}ay" if word.match(VOWEL_SOUNDS_REGEX)

      word.sub(CONSONANT_SOUNDS_REGEX, '\k<rest>\k<consonant>ay')
    end
  end
end
