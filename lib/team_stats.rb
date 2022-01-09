require './lib/hash_data'
require 'pry'

class TeamStats < HashData


  def team_info(team_id)
    choosen_team = @teams.select {|team| team.team_id == team_id}
    hashed = {
      "team_id" => choosen_team[0].team_id,
      "franchise_id" => choosen_team[0].franchise_id,
      "team_name" => choosen_team[0].team_name,
      "abbreviation" => choosen_team[0].abbreviation,
      "link" => choosen_team[0].link
      }
  end

  def best_season(team_id)
    seasons_played = @games.find_all {|game| game.away_team_id || game.home_team_id == team_id}
    games_played = @game_teams.find_all {|team| team.team_id == team_id}
    binding.pry

    puts
  end

  def average_win_percentage(team_id)
    team_games = @game_teams.find_all { |game| game.team_id == team_id}
    total_games = team_games.size
    wins = team_games.count { |game| game.result == "WIN"}
    awp = (wins.to_f / total_games).to_f.round(2)
  end

end

# games_played = @game_teams.find_all {|team| team.team_id == team_id}
# game_ids = games_played.map {|game| game.game_id1}
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
# @seasons_hashed = @games.group_by { |game| game.game_id }
# (people1 + people2)
#   .group_by { |person| person[:name] }
#   .map(&:last)
#   .select { |people| people.count > 1 }

#   team_hash = teams.map do |row|
#     row.to_h
#   end
#   team_hash_reduced = team_hash.each do |team|
#     team.delete_if {|key, value| key == :stadium}
#   teams = CSV.read './data/teams.csv', headers: true, header_converters: :symbol
#   team_hash = teams.map do |row|
#     row.to_h
#   end
#   team_hash_reduced = team_hash.each do |team|
#     team.delete_if {|key, value| key == :stadium}
    # teams_grouped = @teams.group_by {|team| team.team_id }
    # choosen = teams_grouped.select {|team, info| team == team_id}
    # team_hash = @teams.map do |row|
    #     row.to_h
    #   end
    # all_team_info = @teams
    # select_team = all_team_info.map do {|team| team.team_id == team_id}
    # required_team_info = select_team.each do |team|
    #   team.delete_if {|key, value| key == :stadium}

        # games_played_season = games_played.group_by { |game| game.game_id[0..3]}
        # calculate_each_season = games_played_season.each do |season, games|
        #   season.count {|game| game.result == "WIN"}
        #   end.count


        # what_seasons = @games.map do { |game| game.game_id == games_played.each do |game| game.game_id1}



          # => games_played.map do {|game| game.game_id == what_seasons.key}

        # g

        # game_ids = games_played.map {|game| game.game_id}.sort
        # what_seasons = @games.find_all { |game| games_played.game_id == game.game_id}
        # seasons = @games.group_by { |game| game.season}
        # teams = @game_teams.group_by { |team| team.team_id}
        # team_game_by_season = group_by do {| season, games| games.home_team_id || games.away_team_id == team_id}
