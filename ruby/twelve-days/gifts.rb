# frozen_string_literal: true

module TwelveDays
  class Verse
    class Gifts
      GIFTS = [
        "a Partridge in a Pear Tree",
        "two Turtle Doves",
        "three French Hens",
        "four Calling Birds",
        "five Gold Rings",
        "six Geese-a-Laying",
        "seven Swans-a-Swimming",
        "eight Maids-a-Milking",
        "nine Ladies Dancing",
        "ten Lords-a-Leaping",
        "eleven Pipers Piping",
        "twelve Drummers Drumming"
      ].freeze

      def initialize(number)
        @number = number - 1
      end

      def to_s
        gifts[-1] = "and #{gifts[-1]}" if gifts.size > 1

        gifts.join(", ")
      end

      private

      attr_reader :number

      def gifts
        @gifts ||= GIFTS[0..number].reverse
      end
    end
  end
end
