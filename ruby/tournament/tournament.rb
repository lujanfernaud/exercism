# frozen_string_literal: true

require "pry"

class Tournament
  class << self
    def tally(input)
      matches = create_matches(input)
      teams_data = calculate_teams_data(matches)

      Table.new(teams_data).build
    end

    private

    def create_matches(input)
      [].tap do |matches|
        input.each_line(chomp: true) do |line|
          team_one, team_two, result = line.split(";")

          match = Match.new(
            team_one: team_one,
            team_two: team_two,
            result: result
          )

          matches << match
        end
      end
    end

    def calculate_teams_data(matches)
      initial_team_data = { played: 0, won: 0, drawn: 0, lost: 0, points: 0 }

      {}.tap do |result|
        matches.each_with_index do |match, _index|
          next if match.to_a.any?(&:nil?)

          unless result.keys.include?(match.team_one)
            result[match.team_one] = OpenStruct.new(initial_team_data.merge(name: match.team_one))
          end

          unless result.keys.include?(match.team_two)
            result[match.team_two] = OpenStruct.new(initial_team_data.merge(name: match.team_two))
          end

          result[match.team_one][:played] += 1
          result[match.team_two][:played] += 1

          if match.draw?
            result[match.team_one][:drawn] += 1
            result[match.team_one][:points] += 1
            result[match.team_two][:drawn] += 1
            result[match.team_two][:points] += 1
          else
            result[match.winner][:won] += 1
            result[match.winner][:points] += 3
            result[match.loser][:lost] += 1
            result[match.loser][:points] += 0
          end
        end
      end
    end
  end
end

class Match
  attr_reader :team_one, :team_two, :result

  def initialize(team_one:, team_two:, result:)
    @team_one = team_one
    @team_two = team_two
    @result = result
  end

  def draw?
    @result == "draw"
  end

  def winner
    case result
    when "win" then team_one
    when "loss" then team_two
    end
  end

  def loser
    case result
    when "loss" then team_one
    when "win" then team_two
    end
  end

  def to_a
    [team_one, team_two, result]
  end
end

class Table
  COLUMNS_JUSTIFICATION = {
    0 => [:ljust, 30],
    1 => [:rjust, 2],
    2 => [:rjust, 2],
    3 => [:rjust, 2],
    4 => [:rjust, 2],
    5 => [:rjust, 2]
  }.freeze

  HEADER = %w[Team MP W D L P].freeze

  def initialize(teams_data)
    @teams_data = teams_data
    @result = []
  end

  def build
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
    sorted_team_data.map do |_key, team|
      team.to_h.slice(:name, :played, :won, :drawn, :lost, :points).values
    end
  end

  def sorted_team_data
    sorted_data = teams_data.sort_by { |team| team[1].name }.reverse

    sorted_data.sort_by { |team| team[1].points }.reverse
  end

  def format_result
    result.flatten.join("\n") + "\n"
  end
end
