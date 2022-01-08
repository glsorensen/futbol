require './lib/hash_data.rb'

class GameStats < HashData

  attr_reader :rows
  def initialize(rows)
    @rows = rows
    super(games)
  end

  def highest_total_score

  end

  def lowest_total_score
    #game_statistic
  end

  def percentage_home_wins
    #game_statistic
  end

  def percentage_visitor_wins
    #game_statistic
  end

  def percentage_ties
    #game_statistic
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
