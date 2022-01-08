require './lib/hash_data.rb'
require 'pry'
class GameStats < HashData


  def highest_total_score
    a = @games[:away_goals].map(&:to_i)
    b = @games[:home_goals].map(&:to_i)
    c = a.zip(b)
    d = c.map(&:sum).max
  end

  def lowest_total_score
    a = @games[:away_goals].map(&:to_i)
    b = @games[:home_goals].map(&:to_i)
    c = a.zip(b)
    d = c.map(&:sum).min
  end

  def percentage_home_wins
    home_games = @game_teams.select {|value| value[:hoa] == "home"}.count.to_f
    home_game_wins = @game_teams.select {|value|value[:hoa] == "home" && value[:result] == "WIN"}.count.to_f
    (home_game_wins / home_games).round(2)
  end

  def percentage_visitor_wins
    home_games = @game_teams.select {|value| value[:hoa] == "home"}.count.to_f
    home_game_wins = @game_teams.select {|value|
      value[:hoa] == "home" && value[:result] == "LOSS"}.count.to_f
    (home_game_wins / home_games).round(2)
  end

  def percentage_ties
    ties = @game_teams.select {|value| value[:result] == "TIE"}.count.to_f/2
    total_games = @game_teams.select {|value| value[:result]}.count.to_f/2
    (ties / total_games).round(2)
    # require 'pry' ; binding.pry
  end

  def count_of_games_by_season
    #game_statistic
  end

  def average_goals_per_game
    #game_statistic
  end

  def average_goals_by_season
    #game_statistic
  end

end
