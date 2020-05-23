# frozen_string_literal: true

require_relative "tournament/parser"
require_relative "tournament/matches"
require_relative "tournament/tally"
require_relative "tournament/table"

module Tournament
  POINTS = {
    won: 3,
    drawn: 1,
    lost: 0
  }.freeze

  def self.tally(input)
    parsed_input = Parser.new(input).parse
    matches = Matches.new(parsed_input).create
    tally = Tally.new(matches).build

    Table.new(tally).build
  end
end
