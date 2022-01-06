require './lib/season_stats'
require 'csv'
RSpec.describe do
  let(:game_path) {'./data/games.csv'}
  let(:team_path) {'./data/teams.csv'}
  let(:game_teams_path) {'./data/game_teams.csv'}
  let(:baby_games) {'./data/baby_games.csv'}
  let(:baby_data) {'./data/baby_data.csv'}
  let(:locations) {{
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }}
  let(:season_stats) {SeasonStats.new(locations)}

  it 'exists' do
    expect(season_stats).to be_a SeasonStats
  end

  it "initializes" do
    expect(season_stats.games).to eq(game_path)
    expect(season_stats.teams).to eq(team_path)
    expect(season_stats.game_teams).to eq(game_teams_path)
  end

  xit "parse CSVs" do
    expect(season_stats.parse(season_stats.games)).to eq(game_path)
  end

  it "can find game_ids based on season" do
    expectation = ["2012030221", "2012030222"]
    expect(season_stats.games_in_season(baby_games, "20122013")).to eq(expectation)
  end

  it "gets rows based on season" do
    season_stats.games_in_season(baby_games, "20122013")
    expect(season_stats.get_season_rows(baby_data, :game_id, "20122013").size).to eq(2)
  end

  it "get_coaches_arr" do

  end
  xit "winningest_coach" do

  end
end
