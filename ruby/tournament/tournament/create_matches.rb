# frozen_string_literal: true

require_relative "match"

module Tournament
  class CreateMatches
    def self.call(parsed_input)
      parsed_input.map do |match_data|
        Match.new(
          team_one: match_data[:team_one],
          team_two: match_data[:team_two],
          result: match_data[:result]
        )
      end
    end
  end
end
