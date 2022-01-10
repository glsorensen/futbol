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

  it 'exists' do

    expect(team).to be_a(TeamStats)
  end

  it 'test 1 * team will hash requested team info' do
    expected = {
      "team_id" => "18",
      "franchise_id" => "34",
      "team_name" => "Minnesota United FC",
      "abbreviation" => "MIN",
      "link" => "/api/v1/teams/18"
    }

    expect(team.team_info('18')).to eq(expected)
  end

  it 'filter games_teams by team_id' do

    expect(team.games_filter_game('6').size).to eq 510
  end

  it 'array of games ids played' do

    expect(team.game_ids('6').size).to eq 510
  end

  it 'can filter game_teams using game ids array' do

    expect(team.games_filter_game('6').size).to eq 510
  end

  it 'can create a merged array of game_teams and games ' do

    expect(team.sorted_games_array('6').size).to eq 510
  end

  it 'test 4* can calculate average_win_percentage' do

     expect(team.average_win_percentage('6')).to eq(0.49)
   end

   it 'can hash a team games by season' do

     expect(team.hash_team_games_by_season('18').size).to eq(6)
   end

   it 'test 2* can calculate a teams best_season' do

     expect(team.best_season("6")).to eq "20132014"
   end

   it 'test 3* can calculate a teams worst_season' do

     expect(team.worst_season("6")).to eq "20142015"
   end


   it 'test 5* can calculate the most goals scored for a team' do

     expect(team.most_goals_scored("18")).to eq 7
   end

   it 'test 6* can calculate the least goals scored for a team' do

     expect(team.fewest_goals_scored("18")).to eq 0
   end

   it 'can calculate a teams favorite_opponent' do
     expect(team.favorite_opponent("18")).to eq "DC United"
   end 
end
