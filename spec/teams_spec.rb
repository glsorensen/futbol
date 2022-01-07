require './spec/spec_helper'

RSpec.describe 'Teams' do
 let(:game) {Teams.new('./data/teams.csv')}

  it 'exists' do

    expect(game).to be_a(Teams)
  end
end
