require_relative './hash_data.rb'
require 'pry'
require_relative './gamestatsable.rb'
class GameStats < HashData
  include GameStatsable

  def highest_total_score
    total_goals_each_game.max
  end

  def lowest_total_score
    total_goals_each_game.min
  end

  def percentage_home_wins
    home_game_wins = @game_teams.select {|value|value[:hoa] == "home" && value[:result] == "WIN"}.count.to_f
    (home_game_wins / select_home_games_float).round(2)
  end

  def percentage_visitor_wins
    home_game_wins = @game_teams.select {|value| value[:hoa] == "home" && value[:result] == "LOSS"}.count.to_f
    (home_game_wins / select_home_games_float).round(2)
  end

  def percentage_ties
    ties = @game_teams.select {|value| value[:result] == "TIE"}.count.to_f/2
    (ties / (@game_teams.count / 2.0)).round(2)
  end

  def count_of_games_by_season
    games_per_season = @games.group_by {|game| game[:season]}
    games_per_season.transform_values! {|value| value.count}
  end

  def average_goals_per_game
    total_goals = total_goals_each_game.sum
    (total_goals / @games[:game_id].count.to_f).round(2)
  end

  def average_goals_by_season
    goals = []
    games_per_season = @games.group_by {|game| game[:season]}
    goals << away = games_per_season.map {|season, game| game.map {|game| game.values_at[6].to_f}.inject(:+)}
    goals << home = games_per_season.map {|season, game| game.map {|game| game.values_at[7].to_f}.inject(:+)}
    total_goals_by_season = goals.transpose.map(&:sum)
    total_games_by_season = games_per_season.map {|season, game| game.map {|game| game.values_at[0]}.count}
    average_goals_per_game_season = total_goals_by_season.zip(total_games_by_season).map {|totals| totals.inject(:/).round(2)}
    hash_of_average_goals_season = Hash[games_per_season.keys.zip(average_goals_per_game_season)]
  end

end
