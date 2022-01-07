require './lib/hash_data.rb'
require 'pry'


RSpec.describe 'HashData' do
  let(:games_data) {'./data/games.csv'}
  let(:teams_data) {'./data/teams.csv'}
  let(:game_teams_data) {'./data/game_teams.csv'}
  let(:data) {{
        :games => games_data,
        :teams => teams_data,
        :game_teams => game_teams_data
    }}

  let(:hash_data) {HashData.new(data)}

  it 'exists' do
# binding.pry
    expect(hash_data).to be_a(HashData)
  end
end
