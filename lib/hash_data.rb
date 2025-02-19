require 'csv'
require_relative './games.rb'
require_relative './teams.rb'
require_relative './game_teams.rb'

class HashData
  attr_reader :games, :teams, :game_teams, :hash, :team_names, :team_id
  def initialize(data)
    @hash = {}
    @team_names = {}
    @hoa = {}
    @team_id = {}
    @games = CSV.read(data[:games], headers: true, header_converters: :symbol).each { |row| @hash[row[:date_time]] = Games.new(row) }
    @teams = CSV.read(data[:teams], headers: true, header_converters: :symbol).each { |row| @hash[row[:team_id]] = Teams.new(row) }
    @game_teams = CSV.read(data[:game_teams], headers: true, header_converters: :symbol).each { |row| @hash[row[:game_id]] = GameTeams.new(row) }
    @get_team_names = CSV.read(data[:teams], headers: true, header_converters: :symbol).each { |row| @team_names[row[:teamname]] = {} }
    @get_home_away = CSV.read(data[:game_teams], headers: true, header_converters: :symbol).each { |row| @hoa[row[:hoa]] = [] }
    @link_team_id_to_team_name = CSV.read(data[:teams], headers: true, header_converters: :symbol).each { |row| @team_id[row[:team_id]] = row[:teamname] }
    @games1 = CSV.read(data[:games], headers: true, header_converters: :symbol).map {|row| Games.new(row)}
    @teams1 = CSV.read(data[:teams], headers: true, header_converters: :symbol).map {|row| Teams.new(row)}
    @game_teams1 = CSV.read(data[:game_teams], headers: true, header_converters: :symbol).map {|row| GameTeams.new(row)}
  end

  def name_convert(team_id)
    @teams.each do |row|
      if row[:team_id] == team_id
        return row[:teamname]
      end
    end
  end

  def merge_hash
    @team_names.transform_values { |value| value = @hoa }
  end
end
