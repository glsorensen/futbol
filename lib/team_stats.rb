require_relative './hash_data'
require 'pry'

class TeamStats < HashData

  def game_teams_filtered(team_id)
    @game_teams.find_all {|team| team.team_id == team_id}
  end

  def games_filtered(team_id)
    @games.filter {|game| game.away_team_id == team_id || game.home_team_id == team_id}
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
    ab.select {|game| opponent_array << game.away_team_id}
    ab.select {|game| opponent_array << game.home_team_id}
    c = opponent_array.uniq.sort
    c.delete(team_id)
    c
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
       wins_hashed[season] = (games.count { |game| game[0].result == "WIN"} / games.size.to_f.round(3))
    select_winner = wins_hashed.max_by{|k,v| v}
  end
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

  def fewest_goals_scored(team_id)
    a = game_teams_filtered(team_id)
    min_game = a.min_by {|game| game.goals}
    min_game.goals.to_i
  end

  def select_team_games_hash(team_id)
    ab = games_filtered(team_id)
    clean_array = opponent_array(team_id)
    games_hash = Hash[clean_array.map {|oti| [oti, Array.new]}]
    add_away_games = ab.each do |game|
      if games_hash.has_key?(game.away_team_id) ; games_hash[game.away_team_id] << game
    end
  end
    add_home_games = ab.each do |game|
      if games_hash.has_key?(game.home_team_id) ; games_hash[game.home_team_id] << game
    end
  return games_hash
  end
  end

  def who_won(team_id)
    # games_hashed_by_opponent = select_team_games_hash(team_id)
    # winners = {}
    # team_won = []
    # opponent_won = []
    # winners[opponent] = [[team_won],[opponent_won]]

#     each_winner = games_hashed_by_opponent.map do |opponent, games|
#       games.each do |game|
#         if game.away_goals.to_i > game.home_goals.to_i && game.away_team_id == team_id
#         winners[opponent] << team_won game
#           team_won << game
#         elsif game.away_goals.to_i > game.home_goals.to_i && game.away_team_id != team_id
#           opponent_won << game
#         elsif game.home_goals.to_i > game.away_goals.to_i && game.home_team_id == team_id
#           team_won << game
#         elsif game.home_goals.to_i > game.away_goals.to_i && game.home_team_id != team_id
#           opponent_won << game
#           else
#             "there was an error"
#           end
#         end
#         print "  Team won #{team_won.size} games AND Opponent won #{opponent_won.size}.  "
#       end
#   end
#
#
#
#   def best_opponent(team_id)
#     who_won(team_id)
#   games_hashed_by_opponent.each do |opponent, games|
# end
end
end
