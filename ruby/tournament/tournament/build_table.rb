# frozen_string_literal: true

module Tournament
  class BuildTable
    COLUMNS_JUSTIFICATION = {
      0 => [:ljust, 30],
      1 => [:rjust, 2],
      2 => [:rjust, 2],
      3 => [:rjust, 2],
      4 => [:rjust, 2],
      5 => [:rjust, 2]
    }.freeze

    DATA = {
      name: "Team",
      played: "MP",
      won: "W",
      drawn: "D",
      lost: "L",
      points: "P"
    }.freeze

    HEADER = DATA.values

    def self.call(teams_data)
      new(teams_data).call
    end

    def initialize(teams_data)
      @teams_data = teams_data
      @result = []
    end

    def call
      add_header
      add_team_rows
      format_result
    end

    private

    attr_reader :teams_data
    attr_accessor :result

    def add_header
      result << format_row(HEADER)
    end

    def format_row(row)
      row.map.with_index do |column, index|
        column.to_s.send(*COLUMNS_JUSTIFICATION[index])
      end.join(" | ")
    end

    def add_team_rows
      result << team_rows.map { |team_row| format_row(team_row) }
    end

    def team_rows
      sorted_team_data.map { |team| team.slice(*DATA.keys).values }
    end

    def sorted_team_data
      teams_data
        .sort_by { |team| team[:name] }.reverse
        .sort_by { |team| team[:points] }.reverse
    end

    def format_result
      result.flatten.join("\n") + "\n"
    end
  end
end
