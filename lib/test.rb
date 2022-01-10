require './lib/hash_data'

class LeagueStats < HashData

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

  def highest_score(location)
    team = team_scores_at_location(location).sort_by do |key, value|
      value.sum.to_f / value.length
    end
    name_convert(team[-1][0])
  end

  def lowest_score(location)
    team = team_scores_at_location(location).sort_by do |key, value|
      value.sum.to_f / value.length
    end
    name_convert(team[0][0])
  end
end
