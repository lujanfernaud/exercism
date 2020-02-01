# frozen_string_literal: true

require_relative "day"
require_relative "gifts"

module TwelveDays
  class Verse
    def self.prepare(number)
      new(number).prepare
    end

    def initialize(number)
      @number = number + 1
    end

    def prepare
      day + gifts + "."
    end

    private

    attr_reader :number

    def day
      @day ||= Day.new(number).to_s
    end

    def gifts
      @gifts ||= Gifts.new(number).to_s
    end
  end
end
