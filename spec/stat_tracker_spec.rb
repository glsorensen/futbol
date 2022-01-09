require './spec/spec_helper'

RSpec.describe 'StatTracker' do
  let(:game_path) {'./data/games.csv'}
  let(:team_path) {'./data/teams.csv'}
  let(:game_teams_path) {'./data/game_teams.csv'}
  let(:locations) {{
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }}
 let(:stat_tracker) {StatTracker.new(locations)}

  it 'exists' do

    expect(stat_tracker).to be_a(StatTracker)
  end

  xit 'can hash teams by given criteria' do
    #need to validate expectation
    expect(stat_tracker.parse('./data/games_sample.csv').row_count).to eq(45)
  end

  it "finds the coach with the most wins in a season" do
    #expect(stat_tracker.losingest_coach())
    expect(stat_tracker.winningest_coach("20132014")).to eq "Claude Julien"
  end
end
