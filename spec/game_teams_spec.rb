#require './spec/spec_helper'
require './lib/game_stats'
RSpec.describe 'GameTeams' do
 let(:game_teams) {GameTeams.new('./data/game_teams.csv')}

  it 'exists' do

    expect(game_teams).to be_a(GameTeams)
  end
end
