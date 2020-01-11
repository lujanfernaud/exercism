# frozen_string_literal: true

require_relative "day"
require_relative "gifts"

module TwelveDays
  class Verse
    def initialize(number)
      @number = number + 1
      @result = []
    end

    def to_s
      @result << Day.new(number).to_s
      @result << Gifts.new(number).to_s
      @result << "."
      @result << "\n" if last_verse?

      @result.join
    end

    private

    attr_reader :number

    def last_verse?
      number == VERSES
    end
  end
end
