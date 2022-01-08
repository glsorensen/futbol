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
    (ties / (@game_teams.count / 2.0)).round(2)
  end

  def count_of_games_by_season
    games_per_season = @games.group_by {|game| game[:season]}
    games_per_season.transform_values! {|value| value.count}
    #game_statistic
  end

  def average_goals_per_game
    a = @games[:away_goals].map(&:to_i)
    b = @games[:home_goals].map(&:to_i)
    c = a.zip(b)
    d = c.map(&:sum)
    require 'pry' ; binding.pry
  end

  def average_goals_by_season
    #game_statistic
  end

end
