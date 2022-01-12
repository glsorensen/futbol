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

    expect(team.game_teams_filtered('6').size).to eq 510
  end

  it 'filter games by team id' do
    expect(team.games_filtered('18').size).to eq 513
  end

  it 'array of games ids played' do

    expect(team.game_ids('6').size).to eq 510
  end

  it 'can filter game_teams using game ids array' do

    expect(team.games_filter_game_id('6').size).to eq 510
  end

  it 'can create an opponent_array' do
    expect(team.opponent_array('18').size).to eq 31
  end

  it 'can caculate hash of opponent average win percentage' do
    expected = {"19"=>0.45,
       "52"=>0.4,
       "21"=>0.37,
       "20"=>0.37,
       "17"=>0.38,
       "29"=>0.4,
       "25"=>0.39,
       "16"=>0.44,
       "30"=>0.42,
       "1"=>0.36,
       "8"=>0.42,
       "23"=>0.37,
       "3"=>0.43,
       "14"=>0.42,
       "15"=>0.46,
       "28"=>0.45,
       "22"=>0.33,
       "24"=>0.45,
       "5"=>0.48,
       "2"=>0.36,
       "26"=>0.45,
       "7"=>0.28,
       "27"=>0.34,
       "6"=>0.49,
       "13"=>0.35,
       "10"=>0.34,
       "9"=>0.35,
       "12"=>0.38,
       "54"=>0.5,
       "4"=>0.34,
       "53"=>0.29}
    expect(team.opponent_awp_hash('18')).to eq expected
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

   it 'can create a hash of games for a slected team' do
     # binding.pry
     expect(team.select_team_games_hash("18").size).to eq 31
   end

   xit 'can calculate a teams favorite_opponent' do

     expect(team.best_opponent("18")).to eq "DC United"
   end

   xit 'can calculate a teams rival' do

     expect(team.rival("18")).to eq("Houston Dash").or(eq("LA Galaxy"))
   end
end
