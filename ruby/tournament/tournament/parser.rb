# frozen_string_literal: true

module Tournament
  class Parser
    MATCH_RESULTS = {
      win: { team_one: :winner, team_two: :loser },
      draw: { team_one: :drawn, team_two: :drawn },
      loss: { team_one: :loser, team_two: :winner }
    }.freeze

    def initialize(input)
      @input = input.each_line(chomp: true).reject(&:empty?)
    end

    def parse
      @input.map do |line|
        team_one, team_two, result = line.split(";")
        result = MATCH_RESULTS[result.to_sym]

        next if result.nil?

        { team_one: team_one, team_two: team_two, result: result }
      end.compact
    end
  end
end
