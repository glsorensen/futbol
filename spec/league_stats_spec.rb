require './lib/league_stats'
require 'csv'
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
  let(:league_stats) {LeagueStats.new(locations)}

  it "records scores of all games" do
    expect(league_stats.team_scores_total.values.flatten.length).to eq 33
  end

  it "finds highest scoring team" do
    expect(league_stats.highest_scoring).to eq("North Carolina Courage")
  end

  it "finds the lowest_scoring team" do
    expect(league_stats.lowest_scoring).to eq("New York City FC")
  end

  it "can filter by location" do
    league_stats.location_rows("home")
  end

  it "can find find teams scores by location" do
    expect(league_stats.team_scores_at_location("away").length).to eq(11)
  end

  it "can find the highest scoring home team" do
    expect(league_stats.highest_score_home).to eq("FC Dallas")
  end

  it "can find the lowest_scoring home team" do
    expect(league_stats.lowest_score_home).to eq("Sporting Kansas City")
  end

  it "can find the lowest_scoring away team" do
    expect(league_stats.lowest_score_away).to eq("Orlando City SC")
  end

  it "can find the highest scoring away team" do
    expect(league_stats.highest_score_away).to eq("North Carolina Courage")
  end
end
