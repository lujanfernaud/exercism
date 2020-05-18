require_relative "match/team"

module Tournament
  class Match
    def initialize(team_one:, team_two:, result:)
      @team_one = team_one
      @team_two = team_two
      @result = result
    end

    def teams
      [
        Team.new(**team_attributes(:team_one)).to_h,
        Team.new(**team_attributes(:team_two)).to_h
      ]
    end

    private

    attr_reader :team_one, :team_two, :result

    def team_attributes(team)
      team_result = result[team]
      team_result_attributes = result_attributes[team_result]

      { name: send(team), played: 1 }.merge(team_result_attributes)
    end

    def result_attributes
      {
        winner: { won: 1, points: POINTS[:won] },
        drawn: { drawn: 1, points: POINTS[:drawn] },
        loser: { lost: 1, points: POINTS[:lost] }
      }
    end
  end
end
