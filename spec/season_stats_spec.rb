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
    expectation = [
      "2012030221",
      "2012030222",
      "2012030312",
      "2012030313",
      "2012030314",
      "2012030231",
      "2012030232",
      "2012030233",
      "2012030155",
      "2012030181",
      "2012030182",
      "2012030183",
      "2012020303",
      "2012020089"]
    expect(season_stats.games_in_season("20122013")).to eq(expectation)
  end

  before(:each) do
    season_stats.games_in_season("20122013")
    season_stats.get_season_rows(:game_id)
  end

  it "gets rows based on season" do
    expect(season_stats.get_season_rows(:game_id).size).to eq(7)
  end

  it "gets coaches array" do
    expected = ["John Tortorella", "Claude Julien", "Mike Babcock", "Joel Quenneville", "Mike Yeo"]

    expect(season_stats.get_coaches_arr).to eq(expected)
  end

  it "transforms coaches array to coach classes" do
    expect(season_stats.coach_classes[0]).to be_a(Coach)
  end

  it "records coaches records" do
    expect(season_stats.coach_records[0].games).to eq(2)
  end

  it "sorts the coaches by win percentage" do
    expect(season_stats.sort_by_win_percent[0].name).to eq("John Tortorella")
    expect(season_stats.sort_by_win_percent[-1].name).to eq("Joel Quenneville")
  end

  it "finds winningest coach" do
    expect(season_stats.winningest_coach).to eq("Joel Quenneville")
  end

  it "finds losingest coach" do
    expect(season_stats.losingest_coach).to eq("John Tortorella")
  end
end
