# frozen_string_literal: true

require "pry"

class Tournament
  POINTS = {
    won: 3,
    drawn: 1,
    lost: 0
  }.freeze

  class << self
    def tally(input)
      matches = create_matches(input)
      tally = Tally.new(matches.select(&:valid?)).build

      Table.new(tally).build
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
  end
end

class Tally
  def initialize(matches)
    @matches = matches
    @result = {}
  end

  def build
    matches.each_with_object({}) do |match, result|
      match.teams.each do |team|
        unless result.keys.include?(team.name)
          result[team.name] = team.to_h
          next
        end

        match_attributes = result[team.name].reject { |key, _value| key == :name }
        updated_match_attributes = match_attributes.map { |key, value| [key, value + team.to_h[key]] }.to_h
        updated_team_data = updated_match_attributes.merge(name: team.name)

        result[team.name] = updated_team_data
      end
    end
  end

  private

  attr_reader :matches
  attr_writer :result
end

class Match
  attr_reader :team_one, :team_two, :result

  def initialize(team_one:, team_two:, result:)
    @team_one = Match::Team.new(name: team_one)
    @team_two = Match::Team.new(name: team_two)
    @result = result

    calculate_teams_data if valid?
  end

  def valid?
    to_a.none?(&:nil?)
  end

  def to_a
    [team_one, team_two, result]
  end

  def teams_data
    {
      team_one => team_one.to_h,
      team_two => team_two.to_h
    }
  end

  def teams
    [team_one, team_two]
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

  private

  def calculate_teams_data
    return teams.each(&:drawn) if draw?

    winner.won
    loser.lost
  end
end

class Match::Team
  attr_reader :name, :points

  def initialize(name:, played: 1)
    @name = name
    @played = played
    @won = 0
    @drawn = 0
    @lost = 0
    @points = 0
  end

  def to_h
    {
      name: @name,
      played: @played,
      won: @won,
      drawn: @drawn,
      lost: @lost,
      points: @points
    }
  end

  def won
    @won = 1
    @points = Tournament::POINTS[:won]
  end

  def drawn
    @drawn = 1
    @points = Tournament::POINTS[:drawn]
  end

  def lost
    @lost = 1
    @points = Tournament::POINTS[:lost]
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
    sorted_data = teams_data.sort_by { |team| team[1][:name] }.reverse

    sorted_data.sort_by { |team| team[1][:points] }.reverse
  end

  def format_result
    result.flatten.join("\n") + "\n"
  end
end
