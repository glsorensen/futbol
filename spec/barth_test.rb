require './lib/test'
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

  it "can filter by location" do
    league_stats.location_rows("home")
  end

  it "can find find teams scores by location" do
    expect(league_stats.team_scores_at_location("away").length).to eq(11)
  end

  it "can find the highest scoring home team" do
    expect(league_stats.highest_score("home")).to eq("FC Dallas")
  end

  it "can find the lowest_scoring home team" do
    expect(league_stats.lowest_score("home")).to eq("Sporting Kansas City")
  end

  it "can find the lowest_scoring away team" do
    expect(league_stats.lowest_score("away")).to eq("Orlando City SC")
  end

  it "can find the highest scoring away team" do
    expect(league_stats.highest_score("away")).to eq("North Carolina Courage")
  end

  it "can find the highest scoring team" do
    expect(league_stats.highest_score("home" || "away"))
  end
end
