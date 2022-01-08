require 'csv'
require './lib/games.rb'
require './lib/teams.rb'
require './lib/game_teams.rb'


class HashData
  attr_reader :games, :teams, :game_teams, :hash

  def initialize(data)
    @hash = {}
    @games = CSV.read(data[:games], headers: true, header_converters: :symbol).each { |row| @hash[row[:game_id]] = Games.new(row) }
    @teams = CSV.read(data[:teams], headers: true, header_converters: :symbol).each { |row| @hash[row[:team_id]] = Teams.new(row) }
    @game_teams = CSV.read(data[:game_teams], headers: true, header_converters: :symbol).each { |row| @hash[row[:game_id]] = GameTeams.new(row) }
  end


end
