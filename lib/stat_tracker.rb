# require './spec/spec_helper'
require './lib/game_stats.rb'
require './lib/hash_data.rb'

class StatTracker

  def initialize(data_location)
    @hash_data = HashData.new(data_location)
    @game_stats = GameStats.new(data_location)
    @league_stats = LeagueStats.new(data_location)
    # @team_stats = TeamStats.new
    # @season_stats = SeasonStats.new
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
   #game_statistic
 end

   def count_of_teams
      @league_stats.league_count
    end

    def best_offense
      #league_statistics
    end

    def worst_offense
      #league_statistics
    end

    def highest_scoring_visitor
      #league_statistics
    end

    def highest_scoring_home_team
      #league_statistics
    end

    def lowest_scoring_visitor
      #league_statistics
    end

    def lowest_scoring_home_team
      #league_statistics
    end

    def winningest_coach(season_id)
      @season_stats.winningest_coach(season_id)
    end

    def worst_coach
      @season_stats.losingest_coach(season_id)
    end

    def most_accurrate_team
      @season_stats.scoringest_team(season_id)
    end

    def least_accurate_team
      @season_stats.missingest_team(season_id)
    end

    def most_tackles
      @season_stats.tackliest_team(season_id)
    end

    def fewest_tackles
      @season_stats.untackliest_team(season_id)
    end

    def team_info
      #team_statistics
    end

    def best_season
      #team_statistics
    end

    def worst_season
      #team_statistics
    end

    def average_win_percentage
      #team_statistics
    end

    def most_goals_scored
      #team_statistics
    end

    def fewest_goals_scored
      #team_statistics
    end

    def favorite_opponent
      #team_statistics
    end

    def rival
      #team_statistics
    end

end
