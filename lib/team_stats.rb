

require './lib/hash_data'
require 'pry'

class TeamStats < HashData

  def games_teams_played(team_id)
    a = @game_teams1.find_all {|team| team.team_id == team_id}
  end

  def game_ids(team_id)
    a = games_teams_played(team_id)
    b = a.map {|game| game.game_id}
  end

  def games_filter_game(team_id)
    a = games_teams_played(team_id)
    b = game_ids(team_id)
    games_filter = @games1.filter {|game| b.include?(game.game_id)}
  end

  def team_info(team_id)
    choosen_team = @teams1.select {|team| team.team_id == team_id}
    hashed = {
      "team_id" => choosen_team[0].team_id,
      "franchise_id" => choosen_team[0].franchise_id,
      "team_name" => choosen_team[0].team_name,
      "abbreviation" => choosen_team[0].abbreviation,
      "link" => choosen_team[0].link
      }
  end

  def sorted_games_array(team_id)
    a = games_teams_played(team_id)
    c = games_filter_game(team_id)
    d = sorted_game_teams = a.sort_by {|game| game.game_id}
    e = sorted_games = c.sort_by {|game| game.game_id}
    merged_array = d.zip(e)
  end

  def hash_team_games_by_season(team_id)
    g = sorted_games_array(team_id)
    flattened_game_array = g.map {|info| info.flatten}
    hashed_by_season = flattened_game_array.group_by {|game| game[1].season}
  end

  def average_win_percentage(team_id)
    a = games_teams_played(team_id)
    total_games = a.size
    wins = a.count { |game| game.result == "WIN"}
    awp = (wins.to_f / total_games).to_f.round(2)
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
    select_loser = wins_hashed.min_by{|k,v| v}
    select_loser[0]
  end

  def most_goals_scored(team_id)
    a = games_teams_played(team_id)
    max_game = a.max_by {|game| game.goals}
    max_game.goals.to_i
  end

  def  fewest_goals_scored(team_id)
    a = games_teams_played(team_id)
    max_game = a.min_by {|game| game.goals}
    max_game.goals.to_i
  end

end
