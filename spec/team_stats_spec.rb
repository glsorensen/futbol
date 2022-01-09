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

  it '2* can print team atributes' do
    expected = {
      "team_id" => "18",
      "franchise_id" => "34",
      "team_name" => "Minnesota United FC",
      "abbreviation" => "MIN",
      "link" => "/api/v1/teams/18"
    }
    # binding.pry
    expect(team.team_info('18')).to eq(expected)
  end

  it '3* can calculate average_win_percentage' do

     expect(team.average_win_percentage('6')).to eq(0.49)
   end

   xit '4* can calculate a teams best_season' do

     expect(team.best_season('6')).to eq("20132014")
   end

   it '5* can calculate the most goals scored for a team' do

     expect(team.most_goals_scored("18")).to eq 7
   end

   it '5* can calculate the least goals scored for a team' do

     expect(team.fewest_goals_scored("18")).to eq 0
   end
end
