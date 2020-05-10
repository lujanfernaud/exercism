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
      parsed_input = parse(input)
      matches = create_matches(parsed_input)
      tally = Tally.new(matches).build

      Table.new(tally).build
    end

    private

    def parse(input)
      input.each_line(chomp: true).map do |line|
        match_data = line.split(";")

        %i[team_one team_two result].zip(match_data).to_h
      end
    end

    def create_matches(parsed_input)
      parsed_input.map do |match_data|
        Match.new(
          team_one: match_data[:team_one],
          team_two: match_data[:team_two],
          result: match_data[:result]
        )
      end.select(&:valid?)
    end
  end
end

class Match
  attr_reader :team_one, :team_two, :result

  def initialize(team_one:, team_two:, result:)
    @team_one = Team.new(name: team_one)
    @team_two = Team.new(name: team_two)
    @result = result

    set_teams_data if valid?
  end

  def valid?
    [team_one, team_two, result].none?(&:nil?)
  end

  def teams
    [team_one, team_two]
  end

  private

  def set_teams_data
    return teams.each(&:mark_drawn) if result == "draw"

    winner.mark_won
    loser.mark_lost
  end

  def winner
    status[result.to_sym][:winner]
  end

  def loser
    status[result.to_sym][:loser]
  end

  def status
    {
      win: {
        winner: team_one,
        loser: team_two
      },
      loss: {
        loser: team_one,
        winner: team_two
      }
    }
  end
end

class Match::Team
  attr_reader :name

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

  def mark_won
    return if [@drawn, @lost].any?(&:positive?)

    @won = 1
    @points = Tournament::POINTS[:won]
  end

  def mark_drawn
    return if [@won, @lost].any?(&:positive?)

    @drawn = 1
    @points = Tournament::POINTS[:drawn]
  end

  def mark_lost
    return if [@won, @drawn].any?(&:positive?)

    @lost = 1
    @points = Tournament::POINTS[:lost]
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
