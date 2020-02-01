# frozen_string_literal: true

require_relative "verse"

module TwelveDays
  VERSES = 12

  def self.song
    VERSES.times.map { |number| Verse.new(number).to_s }.join("\n\n") + "\n"
  end
end
