# require './spec/spec_helper'
#
# class SeasonStats < HashData
#   # include Parsable
#   attr_reader :games, :teams, :game_teams
#
#   def initialize(location)
#     @games = location[:games]
#     @teams = location[:teams]
#     @game_teams = location[:game_teams]
#   end
#
#   def games_in_season(season)
#     @game_ids = []
#     parse(@games).filter do |row|
#       @game_ids << row[:game_id] if row[:season] == season
#     end
#     @game_ids
#   end
#
#   def get_season_rows(header)
#     @season_data = []
#     parse(@game_teams).filter do |row|
#       @season_data << row if @game_ids.any?(row[header])
#     end
#     @season_data
#   end
#
#   def get_coaches_arr
#     @season_data.map do |data|
#       data[:head_coach]
#     end.uniq
#   end
#
#   def coach_classes
#     get_coaches_arr.map do |coach|
#       Coach.new({name:coach, wins:0, games:0})
#     end
#   end
#
#   def coach_records
#     coach_classes.map do |coach|
#       @season_data.each do |data|
#         if data[:head_coach] == coach.name
#           coach.add_game
#           if data[:result] == "WIN"
#             coach.add_win
#           end
#         end
#       end
#       coach
#     end
#   end
#
#   def sort_by_win_percent
#     coach_records.sort_by do |coach|
#       coach.win_percentage
#     end
#   end
#
#   def winningest_coach
#     sort_by_win_percent[-1].name
#   end
#
#   def losingest_coach
#     sort_by_win_percent[0].name
#   end
# end
