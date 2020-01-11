# frozen_string_literal: true

require_relative "verse"

module TwelveDays
  VERSES = 12

  def self.song
    result = []

    VERSES.times { |number| result << Verse.new(number).to_s }

    result.join("\n\n")
  end
end
