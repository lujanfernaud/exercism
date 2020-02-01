# frozen_string_literal: true

require_relative "verse"

module TwelveDays
  VERSES = 12

  def self.song
    VERSES.times.map { |number| Verse.prepare(number) }.join("\n\n") + "\n"
  end
end
