#require './spec/spec_helper'
require_relative './hash_data'

class LeagueStats < HashData

  def league_count
    @teams.count
  end

  def team_scores_total
    @game_teams.reduce({}) do |teams, game|
      team_id = game[:team_id]
      team = teams[team_id] || []
      team << game[:goals].to_i
      teams[team_id] = team
      teams
    end
  end

  def highest_scoring
    highest = team_scores_total.max_by do |key, value|
      value.sum.to_f / value.length
    end
    name_convert(highest[0])
  end

  def lowest_scoring
    lowest = team_scores_total.min_by do |key, value|
      value.sum.to_f / value.length
    end
    name_convert(lowest[0])
  end

  def location_rows(location)
    @location_data = []
    @game_teams.filter do |row|
      @location_data << row if row[:hoa] == location
    end
    @location_data
  end

  def team_scores_at_location(location)
    location_rows(location).reduce({}) do |teams, game|
      team_id = game[:team_id]
      team = teams[team_id] || []
      team << game[:goals].to_i
      teams[team_id] = team
      teams
    end
  end

  def highest_score_home
    team = team_scores_at_location("home").sort_by do |key, value|
      value.sum.to_f / value.length
    end
    name_convert(team[-1][0])
  end

  def highest_score_away
    team = team_scores_at_location("away").sort_by do |key, value|
      value.sum.to_f / value.length
    end
    name_convert(team[-1][0])
  end

  def lowest_score_home
    team = team_scores_at_location("home").sort_by do |key, value|
      value.sum.to_f / value.length
    end
    name_convert(team[0][0])
  end

  def lowest_score_away
    team = team_scores_at_location("away").sort_by do |key, value|
      value.sum.to_f / value.length
    end
    name_convert(team[0][0])
  end
end
