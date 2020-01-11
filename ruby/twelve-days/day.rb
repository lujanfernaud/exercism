# frozen_string_literal: true

module TwelveDays
  class Verse
    class Day
      NUMBER_TO_DAY = {
        1 => "first",
        2 => "second",
        3 => "third",
        4 => "fourth",
        5 => "fifth",
        6 => "sixth",
        7 => "seventh",
        8 => "eighth",
        9 => "ninth",
        10 => "tenth",
        11 => "eleventh",
        12 => "twelfth"
      }.freeze

      def initialize(number)
        @number = number
      end

      def to_s
        "On the #{NUMBER_TO_DAY[number]} day of Christmas " \
        "my true love gave to me: "
      end

      private

      attr_reader :number
    end
  end
end
