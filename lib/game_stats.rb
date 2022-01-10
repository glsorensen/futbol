require './lib/hash_data.rb'
require 'pry'
require './lib/gamestatsable.rb'
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
<<<<<<< HEAD
    games_per_season.transform_values! {|value| value.count} 
=======
    games_per_season.transform_values! {|value| value.count}
>>>>>>> 42393fafff27ed9031e86a00dc40a975a3ee9d00
  end

  def average_goals_per_game
    total_goals = total_goals_each_game.sum
    (total_goals / @games[:game_id].count.to_f).round(2)
    # require 'pry' ; binding.pry
  end

  def average_goals_by_season
    games_per_season = @games.group_by {|game| game[:season]}
    #game_statistic
  end

end
