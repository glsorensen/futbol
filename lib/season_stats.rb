require './lib/hash_data'

class SeasonStats < HashData
  attr_reader :season_data, :game_ids

  def games_in_season(season)
    @game_ids = []
    @games.filter do |row|
      @game_ids << row[:game_id] if row[:season] == season
    end
    @game_ids
  end

  def get_season_rows(header = :game_id)
    @season_data = []
    @game_teams.filter do |row|
      @season_data << row if @game_ids.any?(row[header])
    end
    @season_data
  end

  def coach_records
    @season_data.reduce({}) do |coaches, game|
      coach_name = game[:head_coach]
      coach = coaches[coach_name] || Coach.new({name: coach_name, wins: 0, games: 0})
      coach.play_game(game[:result])
      coaches[coach_name] = coach
      coaches
    end.values
  end

  def sort_by_win_percent
    coach_records.sort_by do |coach|
      coach.win_percentage
    end
  end

  def winningest_coach(season)
    games_in_season(season)
    get_season_rows
    sort_by_win_percent[-1].name
  end

  def losingest_coach(season)
    games_in_season(season)
    get_season_rows
    sort_by_win_percent[0].name
  end

  def team_data
    @season_data.reduce({}) do |teams, game|
      team_id = game[:team_id]
      team = teams[team_id] || Team.new({team_id: team_id, shots: 0, goals: 0, tackles: 0})
      team.play_game(game[:shots].to_i, game[:goals].to_i, game[:tackles].to_i)
      teams[team_id] = team
      teams
    end.values
  end

  def sort_by_goal_percent
    team_data.sort_by do |team|
      team.goal_percentage
    end
  end

  def scoringest_team(season)
    games_in_season(season)
    get_season_rows
    name_convert(sort_by_goal_percent[-1].team_id)
  end

  def missingest_team(season)
    games_in_season(season)
    get_season_rows
    name_convert(sort_by_goal_percent[0].team_id)
  end

  def sort_by_tackles
    team_data.sort_by do |team|
      team.tackles
    end
  end

  def tackliest_team(season)
    games_in_season(season)
    get_season_rows
    name_convert(sort_by_tackles[-1].team_id)
  end

  def untackliest_team(season)
    games_in_season(season)
    get_season_rows
    name_convert(sort_by_tackles[0].team_id)
  end
end
