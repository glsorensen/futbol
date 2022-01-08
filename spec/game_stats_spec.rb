require './lib/hash_data.rb'
require './lib/game_stats.rb'

RSpec.describe 'GameStats' do
  let(:games) {'./data/games.csv'}
  let(:teams) {'./data/teams.csv'}
  let(:game_teams) {'./data/game_teams.csv'}
  let(:data) {{
        :games => games,
        :teams => teams,
        :game_teams => game_teams
    }}
    # let(:hash_data) {HashData.new(data)}
    let(:game_stats) {GameStats.new(data)}

  it 'exists' do
     # require 'pry' ; binding.pry
    expect(game_stats).to be_a GameStats
  end

  it 'can calculate highest score' do
    expect(game_stats.highest_total_score).to eq(11)
  end

  it 'needs data to exist' do
    expect{GameStats.new}.to raise_error
  end

  xit "initializes" do
    expect(game_stats.games).to eq(game_data)
    expect(game_stats.teams).to eq(team_data)
    expect(game_stats.game_teams).to eq(game_teams_data)
  end

  xit "parse CSVs" do
    expect(game_stats.parse(game_stats.games)).to eq(game_path)
  end


end
