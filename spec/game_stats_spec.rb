require './spec/spec_helper'
require 'csv'
RSpec.describe do
  let(:game_path) {'./data/games.csv'}
  let(:team_path) {'./data/teams.csv'}
  let(:game_teams_path) {'./data/game_teams.csv'}
  let(:baby_games) {'./data/baby_games.csv'}
  let(:locations) {{
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }}
  let(:game_stats) {GameStats.new(locations)}

  it 'exists' do
    expect(game_stats).to be_a GameStats
  end

  it "initializes" do
    expect(game_stats.games).to eq(game_path)
    expect(game_stats.teams).to eq(team_path)
    expect(game_stats.game_teams).to eq(game_teams_path)
  end

  it "parse CSVs" do
    expect(game_stats.parse(game_stats.games)).to eq(game_path)
  end
end
