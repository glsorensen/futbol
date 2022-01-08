require './lib/season_stats'
require 'csv'
require './lib/coach'
require './lib/futbol_team.rb'
require 'pry'
RSpec.describe do
  let(:game_path) {'./data/games_sample.csv'}
  let(:team_path) {'./data/teams.csv'}
  let(:game_teams_path) {'./data/game_teams_sample.csv'}
  let(:locations) {{
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }}
  let(:season_stats) {SeasonStats.new(locations)}

  it 'exists' do
    expect(season_stats).to be_a SeasonStats
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

  it "creates array of coaches records" do
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

  it "creates an array of team classes" do
    expect(season_stats.team_data[0].goals).to eq(4)
  end

  it "sorts by goal percentage" do
    expect(season_stats.sort_by_goal_percent[0].team_id).to eq("16")
    expect(season_stats.sort_by_goal_percent[-1].team_id).to eq("17")
  end

  it "can convert team ids into team names" do
    expect(season_stats.name_convert("1")).to eq("Atlanta United")
  end

  it "finds the team that scores the most of their shots" do
    expect(season_stats.scoringest_team).to eq("LA Galaxy")
  end

  it "finds the team that scores the least of their shots" do
    expect(season_stats.missingest_team).to eq("New England Revolution")
  end

  it "it sorts by number of tackles" do
    expect(season_stats.sort_by_tackles[0]).to eq("16")
    expect(season_stats.sort_by_tackles[-1]).to eq("3")
  end

  it "finds the team with the most tackles" do
    expect(season_stats.tackliest_team).to eq("Houston Dynamo")
  end

  it "finds the team with the fewest tackles" do
    expect(season_stats.untackliest_team).to eq("New England Revolution")
  end
end
