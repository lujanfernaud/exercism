# frozen_string_literal: true

require_relative "tournament/parse_input"
require_relative "tournament/create_matches"
require_relative "tournament/build_tally"
require_relative "tournament/build_table"

module Tournament
  POINTS = {
    won: 3,
    drawn: 1,
    lost: 0
  }.freeze

  def self.tally(input)
    parsed_input = ParseInput.call(input)
    matches = CreateMatches.call(parsed_input)
    tally = BuildTally.call(matches)

    BuildTable.call(tally)
  end
end
