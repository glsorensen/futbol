require 'csv'
require './lib/games.rb'
require './lib/teams.rb'
require './lib/game_teams.rb'
require './lib/league_stats'


RSpec.describe LeagueStats do
  let(:games) {'./data/games.csv'}
  let(:teams) {'./data/teams.csv'}
  let(:game_teams) {'./data/game_teams.csv'}
  let(:data) {{
        :games => games,
        :teams => teams,
        :game_teams => game_teams
    }}

  let(:league) {LeagueStats.new(data)}

  it 'exists' do
  expect(league).to be_a(LeagueStats)
  end

  it 'can count teams' do
  expect(league.league_count).to eq(32)
  end

  it 'can find best offense' do
    require 'pry'; binding.pry
    expect(league.best_offense).to eq("Reign FC")
  end
end
