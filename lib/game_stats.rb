require './lib/hash_data.rb'
require 'pry'
class GameStats < HashData


  def highest_total_score
    require 'pry' ; binding.pry

    a = @games[:away_goals].map(&:to_i)
    b = @games[:home_goals].map(&:to_i)
    c = a.zip(b)
    d = c.map(&:sum).max
  end

    # c = a.zip(b).map(&:sum).max
    #
    # c.map(&:sum)
    #
    # c.map { |scores|scores.sum }
    #
    # c.map do |scores|
    #       scores.sum
    #     end


    c.max_by {|scores|scores.sum}.sum

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
