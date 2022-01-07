require './spec/spec_helper'

class TeamStatistics
  # include Parsable

  attr_reader :games, :teams, :game_teams

  def initialize

    # @games = location[:games]
    # @teams = location[:teams]
    # @game_teams = location[:game_teams]
  end

  def team_info
    teams = CSV.read './data/teams.csv', headers: true, header_converters: :symbol
    team_hash = teams.map do |row|
      row.to_h
    end
    team_hash_reduced = team_hash.each do |team|
      team.delete_if {|key, value| key == :stadium}
    end
  end

end

# go = TeamStatistics.new

# binding.pry



# p
