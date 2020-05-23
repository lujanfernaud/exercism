# frozen_string_literal: true

module Tournament
  class Tally
    def initialize(matches)
      @matches = matches
    end

    def build
      teams_data.map { |team, matches| sum_team_data(team, matches) }
    end

    private

    attr_reader :matches

    def teams_data
      matches.flat_map(&:teams).group_by { |team| team[:name] }
    end

    def sum_team_data(team, matches)
      team_match_attributes
        .map { |attr| [attr, attribute_sum(matches, attr)] }.to_h
        .merge(name: team)
    end

    def team_match_attributes
      Match::Team::ATTRIBUTES.reject { |attr| attr == :name }
    end

    def attribute_sum(matches, attr)
      matches.sum { |match| match[attr] }
    end
  end
end
