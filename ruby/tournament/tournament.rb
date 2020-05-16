# frozen_string_literal: true

require "pry"

module Tournament
  POINTS = {
    won: 3,
    drawn: 1,
    lost: 0
  }.freeze

  def self.tally(input)
    parsed_input = Parser.new(input).parse
    matches = MatchesCreator.new(parsed_input).create
    tally = Tally.new(matches).build

    Table.new(tally).build
  end
end

class Parser
  MATCH_RESULT = {
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
      result = MATCH_RESULT[result.to_sym]

      { team_one: team_one, team_two: team_two, result: result }
    end
  end
end

class MatchesCreator
  def initialize(parsed_input)
    @parsed_input = parsed_input
  end

  def create
    @parsed_input.map do |match_data|
      Match.new(
        team_one: match_data[:team_one],
        team_two: match_data[:team_two],
        result: match_data[:result]
      )
    end
  end
end

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
    team_state = result[team]
    team_state_attributes = team_attributes_tally[team_state]

    { name: send(team), played: 1 }.merge(team_state_attributes)
  end

  def team_attributes_tally
    {
      winner: { won: 1, points: Tournament::POINTS[:won] },
      drawn:  { drawn: 1, points: Tournament::POINTS[:drawn] },
      loser:  { lost: 1, points: Tournament::POINTS[:lost] }
    }
  end
end

class Match::Team
  attr_reader :name

  ATTRIBUTES = [:name, :played, :won, :drawn, :lost, :points].freeze

  def initialize(args = {})
    args = { name: "" }.merge(args)
    ATTRIBUTES.each { |attr| instance_variable_set("@#{attr}", args[attr] || 0) }
  end

  def to_h
    ATTRIBUTES.map { |attr| [attr, instance_variable_get("@#{attr}")] }.to_h
  end
end

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
    sorted_team_data.map do |team|
      team.slice(*Match::Team::ATTRIBUTES).values
    end
  end

  def sorted_team_data
    sorted_data = teams_data.sort_by { |team| team[:name] }.reverse

    sorted_data.sort_by { |team| team[:points] }.reverse
  end

  def format_result
    result.flatten.join("\n") + "\n"
  end
end
