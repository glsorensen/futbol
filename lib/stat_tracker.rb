#require_relative './spec/spec_helper'
# require 'simplecov'
# SimpleCov.start
require_relative'./game_stats.rb'
require_relative'./league_stats.rb'
require_relative'./season_stats.rb'
require_relative'./team_stats.rb'
require_relative './hash_data.rb'
require_relative './coach.rb'
require_relative './futbol_team.rb'
require 'csv'

class StatTracker
  attr_reader :hash_data, :game_stats, :league_stats, :season_stats

  def initialize(location)
    @hash_data = HashData.new(location)
    @game_stats = GameStats.new(location)
    @league_stats = LeagueStats.new(location)
    @team_stats = TeamStats.new(location)
    @season_stats = SeasonStats.new(location)
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def highest_total_score
   @game_stats.highest_total_score
  end

   def lowest_total_score
     @game_stats.lowest_total_score
   end

   def percentage_home_wins
     @game_stats.percentage_home_wins
   end

   def percentage_visitor_wins
     @game_stats.percentage_visitor_wins
   end

   def percentage_ties
     @game_stats.percentage_ties
   end

   def count_of_games_by_season
     @game_stats.count_of_games_by_season
   end

   def average_goals_per_game
     @game_stats.average_goals_per_game
   end

   def average_goals_by_season
     @game_stats.average_goals_by_season
   end

  def count_of_teams
    @league_stats.league_count
  end

  def best_offense
    @league_stats.highest_scoring
  end

  def worst_offense
    @league_stats.lowest_scoring
  end

  def highest_scoring_visitor
    @league_stats.highest_score_away
  end

  def highest_scoring_home_team
    @league_stats.highest_score_home
  end

  def lowest_scoring_visitor
    @league_stats.lowest_score_away
  end

  def lowest_scoring_home_team
    @league_stats.lowest_score_home
  end

  def winningest_coach(season_id)
    @season_stats.winningest_coach(season_id)
  end

  def worst_coach(season_id)
    @season_stats.losingest_coach(season_id)
  end

  def most_accurate_team(season_id)
    @season_stats.scoringest_team(season_id)
  end

  def least_accurate_team(season_id)
    @season_stats.missingest_team(season_id)
  end

  def most_tackles(season_id)
    @season_stats.tackliest_team(season_id)
  end

  def fewest_tackles(season_id)
    @season_stats.untackliest_team(season_id)
  end

  def team_info(team_id)
    @team_stats.team_info(team_id)
  end

  def best_season(team_id)
    @team_stats.best_season(team_id)
  end

  def worst_season(team_id)
    @team_stats.worst_season(team_id)
  end

  def average_win_percentage(team_id)
    @team_stats.average_win_percentage(team_id)
  end

  def most_goals_scored(team_id)
    @team_stats.most_goals_scored(team_id)
  end

  def fewest_goals_scored(team_id)
    @team_stats.fewest_goals_scored(team_id)
  end

  # def favorite_opponent(team_id)
  #   @team_stats.favorite_opponent(team_id)
  # end
  #
  # def rival
  #   @team_stats
  # end
end
