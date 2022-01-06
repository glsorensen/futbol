require './lib/season_stats'
require 'csv'
require './lib/coach'
RSpec.describe do
  let(:game_path) {'./data/games_sample.csv'}
  let(:team_path) {'./data/teams.csv'}
  let(:game_teams_path) {'./data/game_teams_sample.csv'}
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
    expect(season_stats.get_season_rows(baby_data, :game_id).size).to eq(2)
  end

  it "gets coaches array" do
    season_stats.games_in_season(game_path, "20122013")
    season_stats.get_season_rows(game_teams_path, :game_id)
    expected = ["John Tortorella", "Claude Julien", "Mike Babcock", "Joel Quenneville", "Mike Yeo"]

    expect(season_stats.get_coaches_arr).to eq(expected)
  end

  it "transforms coaches array to coach classes" do
    season_stats.games_in_season(game_path, "20122013")
    season_stats.get_season_rows(game_teams_path, :game_id)
    expect(season_stats.coach_classes[0]).to be_a(Coach)
  end

  xit "finds coaches win percentages" do
    season_stats.games_in_season(game_path, "20122013")
    season_stats.get_season_rows(game_teams_path, :game_id)

    expect(season_stats.coaches_win_percentages[0]).to eq(0)
  end
  xit "winningest_coach" do

  end
end
