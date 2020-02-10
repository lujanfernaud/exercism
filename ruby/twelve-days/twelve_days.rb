# frozen_string_literal: true

require_relative "verse"

module TwelveDays
  def self.song
    12.times.map { |number| Verse.prepare(number) }.join("\n\n") + "\n"
  end
end
