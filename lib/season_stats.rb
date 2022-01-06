require 'parsable'
require './lib/coach'
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

  def get_season_rows(csv, header)
    @season_data = []
    parse(csv).filter do |row|
      @season_data << row if @game_ids.any?(row[header])
    end
    @season_data
  end

  def get_coaches_arr
    @season_data.map do |data|
      data[:head_coach]
    end.uniq
  end

  def coach_classes
    get_coaches_arr.map do |coach|
      Coach.new({name:coach, wins:0, games:0})
    end
  end

  def coach_records
    coach_classes.map do |coach|
      @season_data.each do |data|
        if data[:head_coach] == coach.name
          coach.add_game
          if data[:result] == "WIN"
            coach.add_win
          end
        end
      end
      coach
    end
  end

  def sort_by_win_percent
    #binding.pry
    coach_records.sort_by do |coach|
      coach.win_percentage
    end
  end

  def winningest_coach

  end

end
