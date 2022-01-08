require './lib/hash_data'
require 'pry'

class TeamStats < HashData

  # def team_games(team_id)
  #
  # end
  #
  # def team_info
  #
  # end
  #
  # def best_season(team_id)
  #   seasons = @games.group_by { |game| game.season}
  # binding.pry
  #   puts
  # end

  def average_win_percentage(team_id)
    team_games = @game_teams.find_all { |game| game.team_id == team_id}
    total_games = team_games.size
    wins = team_games.count { |game| game.result == "WIN"}
    awp = (wins.to_f / total_games).to_f.round(2)
  end



end
# go = TeamStatistics.new
#
# binding.pry
#
# p
# team_games = @game_teams.find_all { |game| game.team_id == team_id}
# team_games_by_season = team_games.group_by { |game| game.season}
# losses = team_games.count { |game| game.result == "LOSS"}
# ties = team_games.count { |game| game.result == "TIES"}
# print " W = #{wins} L = #{losses}, T = #{ties}"
# def hash_by(csv, header_to_key)
#     parse(csv).group_by do |row|
#     row[header_to_key]
#   end
# end
#
# def count_hashed_by(csv, header_to_key, specific_key, counted_value)
# hashed = hash_by(csv, header_to_key)
# select_team = hashed.select {|k,v| k == specific_key }
# count = 0
# select_team.each do |key, value|
#   value.map do |row|
#     count += 1 if row[3] == counted_value
#   end
#   return count
# end
# end
#
# def team_info
#   teams = CSV.read './data/teams.csv', headers: true, header_converters: :symbol
#   team_hash = teams.map do |row|
#     row.to_h
#   end
#   team_hash_reduced = team_hash.each do |team|
#     team.delete_if {|key, value| key == :stadium}
#   end
# end
