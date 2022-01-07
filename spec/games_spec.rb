require './spec/spec_helper'


RSpec.describe 'Games' do
 let(:game) {Games.new('./data/games.csv')}

  it 'exists' do

    expect(game).to be_a(Games)
  end
end
