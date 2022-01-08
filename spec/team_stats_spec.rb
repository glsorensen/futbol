require './lib/hash_data'
require './lib/team_stats'
require 'pry'

RSpec.describe TeamStats do
  let(:games_data) {'./data/games.csv'}
  let(:teams_data) {'./data/teams.csv'}
  let(:game_teams_data) {'./data/game_teams.csv'}
  let(:data) {{
        :games => games_data,
        :teams => teams_data,
        :game_teams => game_teams_data
    }}
    let(:team) {TeamStats.new(data)}

  it '1* exists' do

    expect(team).to be_a(TeamStats)
  end

  it '2* can calculate average_win_percentage' do
     expect(team.average_win_percentage('6')).to eq(0.49)
   end

   # it '3* can calculate a teams best_season' do
   #
   #   expect(team.best_season('6')).to eq(0.49)
   # end


end
