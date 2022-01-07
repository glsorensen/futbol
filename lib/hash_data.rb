require 'csv'
require './lib/games.rb'
require './lib/teams.rb'
require './lib/game_teams.rb'

class HashData
  attr_reader :games, :teams, :game_teams

  def initialize(data)
    @games = CSV.read(data[:games], headers: true, header_converters: :symbol).map {|row| Games.new(row)}
    @teams = CSV.read(data[:teams], headers: true, header_converters: :symbol).map {|row| Teams.new(row)}
    @game_teams = CSV.read(data[:game_teams], headers: true, header_converters: :symbol).map {|row| GameTeams.new(row)}
  end
end
