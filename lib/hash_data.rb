require 'csv'
require 'game_stats'
require 'league_stats'
require 'season_stats'
require 'team_stats'

class HashData
  attr_reader :games, :teams, :game_teams
  def initialize(data)
    @games = CSV.read(data [:games], headers: true, header_converters: :symbol).map {|row| Games.new(row)}
    @teams = CSV.read(data [:games], headers: true, header_converters: :symbol).map {|row| Teams.new(row)}
    @game_teams = CSV.read(data [:games], headers: true, header_converters: :symbol).map {|row| GameTeams.new(row)}
  end
end
