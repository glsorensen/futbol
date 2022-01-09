require './spec/spec_helper'

RSpec.describe 'StatTracker' do
  let(:games) {'./data/games.csv'}
  let(:teams) {'./data/teams.csv'}
  let(:game_teams) {'./data/game_teams.csv'}
  let(:data) {{
        :games => games,
        :teams => teams,
        :game_teams => game_teams
    }}
 let(:stat_tracker) {StatTracker.new(data)}

  it 'exists' do
    require 'pry' ; binding.pry
    expect(stat_tracker).to be_a(StatTracker)
  end

  xit 'can hash teams by given criteria' do
    #need to validate expectation
    expect(stat_tracker.parse('./data/games_sample.csv').row_count).to eq(45)
  end
end
