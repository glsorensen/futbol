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
    binding.pry
    expect(hash_data).to be_a(HashData)
  end

  it 'creates Games class objects' do
    binding.pry
    expect(hash_data.games).to be_a(Games)
  end

  xit 'creates Teams class objects' do
    expect(hash_data.teams).to be_a(Teams)
  end

  xit 'creates GameTeams class objects' do
    expect(hash_data.game_teams).to be_a(GameTeams)
  end

end
