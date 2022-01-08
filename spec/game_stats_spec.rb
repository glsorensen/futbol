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

  it 'needs data to exist' do
    expect{GameStats.new}.to raise_error(ArgumentError)
  end

  it "#highest_total_score" do
    expect(game_stats.highest_total_score).to eq 11
  end

  it "#lowest_total_score" do
    expect(game_stats.lowest_total_score).to eq 0
  end

  xit "#percentage_home_wins" do
    expect(game_stats.percentage_home_wins).to eq 0.44
  end

  xit "#percentage_visitor_wins" do
    expect(game_stats.percentage_visitor_wins).to eq 0.36
  end

  xit "#percentage_ties" do
    expect(game_stats.percentage_ties).to eq 0.20
  end

  xit "#count_of_games_by_season" do
    expected = {
      "20122013"=>806,
      "20162017"=>1317,
      "20142015"=>1319,
      "20152016"=>1321,
      "20132014"=>1323,
      "20172018"=>1355
    }
    expect(game_stats.count_of_games_by_season).to eq expected
  end

  xit "#average_goals_per_game" do
    expect(game_stats.average_goals_per_game).to eq 4.22
  end

  xit "#average_goals_by_season" do
    expected = {
      "20122013"=>4.12,
      "20162017"=>4.23,
      "20142015"=>4.14,
      "20152016"=>4.16,
      "20132014"=>4.19,
      "20172018"=>4.44
    }
  end
end
