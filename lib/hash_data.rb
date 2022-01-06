require 'csv'
require 'game_stats'
require 'league_stats'
require 'season_stats'
require 'team_stats'

class HashData
  attr_reader :games, :teams, :game_teams
  def initialize(data)
    @league_stats = CSV.read(data [:games], headers: true, header_converters: :symbol).map {|row| LeagueStats.new(row)}
    @game_stats = CSV.read(data [:games], headers: true, header_converters: :symbol).map {|row| GameStats.new(row)}
    @season_stats = CSV.read(data [:games], headers: true, header_converters: :symbol).map {|row| SeasonStats.new(row)}
    @team_stats = CSV.read(data [:games], headers: true, header_converters: :symbol).map {|row| TeamStats.new(row)}
  end
end
