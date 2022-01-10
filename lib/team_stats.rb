require './lib/hash_data'
require 'pry'

class TeamStats < HashData

  def game_teams_filtered(team_id)
    a = @game_teams.find_all {|team| team.team_id == team_id}
  end

  def games_filtered(team_id)
    ab = @games.filter {|game| game.away_team_id == team_id || game.home_team_id == team_id}
  end

  def game_ids(team_id)
    a = game_teams_filtered(team_id)
    b = a.map {|game| game.game_id1}
  end

  def games_filter_game_id(team_id)
    a = game_teams_filtered(team_id)
    b = game_ids(team_id)
    games_filter = @games.filter {|game| b.include?(game.game_id)}
  end

  def opponent_array(team_id)
    ab = games_filtered(team_id)
    opponent_array = []
    ab.filter.map do |game|
      opponent_array << game.home_team_id if game.home_team_id != team_id
      opponent_array << game.away_team_id if game.away_team_id != team_id
    end
    opponent_array.uniq
  end

  def average_win_percentage(team_id)
    a = game_teams_filtered(team_id)
    total_games = a.size
    wins = a.count { |game| game.result == "WIN"}
    awp = (wins.to_f / total_games).to_f.round(2)
  end

  def opponent_awp_hash(team_id)
    ab = opponent_array(team_id)
    opponent_awp_hash = {}
    calculate_opponent_average_win_percentage = ab.map do |o_team|
      opponent_awp_hash[o_team] = average_win_percentage(o_team)
    end
    opponent_awp_hash
  end

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

  def sorted_games_array(team_id)
    a = game_teams_filtered(team_id)
    c = games_filter_game_id(team_id)
    d = sorted_game_teams = a.sort_by {|game| game.game_id1}
    e = sorted_games = c.sort_by {|game| game.game_id}
    merged_array = d.zip(e)
  end


  def hash_team_games_by_season(team_id)
    g = sorted_games_array(team_id)
    flattened_game_array = g.map {|info| info.flatten}
    hashed_by_season = flattened_game_array.group_by {|game| game[1].season}
  end



  def best_season(team_id)
    h = hash_team_games_by_season(team_id)
    wins_hashed = {}
    h.each do |season, games|
       wins_hashed[season] = (games.count { |game| game[0].result == "WIN"} / games.size.to_f).round(3)
     end
    select_winner = wins_hashed.max_by{|k,v| v}
    select_winner[0]
  end

  def worst_season(team_id)
    h = hash_team_games_by_season(team_id)
    wins_hashed = {}
    h.each do |season, games|
       wins_hashed[season] = (games.count { |game| game[0].result == "WIN"} / games.size.to_f).round(3)
     end
    select_looser = wins_hashed.min_by{|k,v| v}
    select_looser[0]
  end

  def most_goals_scored(team_id)
    a = game_teams_filtered(team_id)
    max_game = a.max_by {|game| game.goals}
    max_game.goals.to_i
  end

  def  fewest_goals_scored(team_id)
    a = game_teams_filtered(team_id)
    min_game = a.min_by {|game| game.goals}
    min_game.goals.to_i
  end

  def favorite_opponent(team_id)
  #   ab = opponent_array(team_id)
  #   opponent_awp_hash = {}
  #   calculate_opponent_average_win_percentage = ab.map do |o_team|
  #     opponent_awp_hash[o_team] = o_team.average_win_percentage
  #   end
  # #
  # binding.pry
  # end
    # opponent_array = []
    # @games.map do |game|
    #   opponent_array << unless game.away_team_id || game.home_team_id

  end
end

  # return unless ship_fits_within?(ship, selected_coordinates)
  #   # TODO: rename valid_placement_overlapping
  #   return unless valid_placement_overlapping?(ship, selected_coordinates))
  #   return true if abc_placement?(ship, selected_coordinates)
  #   return true if numerical_placement?(ship, selected_coordinates)

# games_by_season = b.filter do |season, games|
#   games.filter {|game| game_id.include?(game.game_id)}
# game_teams_filtered = @game_teams.find_all {|team| team.team_id == team_id}
# game_ids = game_teams_filtered.map {|game| game.game_id1}
# go = TeamStatistics.new
#
# binding.pry
#
# p

# def average_win_hash_percentage(games)
#   total_games = games.count
#   wins = games.count { |game| game.result == "WIN"}
#   awhp = (wins.to_f / total_games).to_f.round(2)
# end
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

        # game_teams_filtered_season = game_teams_filtered.group_by { |game| game.game_id[0..3]}
        # calculate_each_season = game_teams_filtered_season.each do |season, games|
        #   season.count {|game| game.result == "WIN"}
        #   end.count


        # what_seasons = @games.map do { |game| game.game_id == game_teams_filtered.each do |game| game.game_id1}



          # => game_teams_filtered.map do {|game| game.game_id == what_seasons.key}

        # g

        # game_ids = game_teams_filtered.map {|game| game.game_id}.sort
        # what_seasons = @games.find_all { |game| game_teams_filtered.game_id == game.game_id}
        # seasons = @games.group_by { |game| game.season}
        # teams = @game_teams.group_by { |team| team.team_id}
        # team_game_by_season = group_by do {| season, games| games.home_team_id || games.away_team_id == team_id}
