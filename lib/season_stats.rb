require 'parsable'
class SeasonStats
  include Parsable
  attr_reader :games, :teams, :game_teams

  def initialize(location)
    @games = location[:games]
    @teams = location[:teams]
    @game_teams = location[:game_teams]
  end

  def games_in_season(csv, season)
    @game_ids = []
    parse(csv).filter do |row|
      @game_ids << row[:game_id] if row[:season] == season
    end
    @game_ids
  end

  def get_season_rows(csv, header, season)
    @season_data = []
    parse(csv).filter do |row|
      @season_data << row if @game_ids.any?(row[header])
    end
    @season_data
  end

end
