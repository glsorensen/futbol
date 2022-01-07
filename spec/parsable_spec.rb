

RSpec.describe 'StatTracker' do
  let(:game_path) {'./data/games.csv'}
  let(:team_path) {'./data/teams.csv'}
  let(:game_teams_path) {'./data/game_teams.csv'}
  let(:baby_data) {'./data/baby_data.csv'}
  let(:locations) {{
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }}
  let(:stat_tracker) {StatTracker.new(locations)}

  it "exists" do
    expect(stat_tracker).to be_a StatTracker
  end

  it "can filter_by_header" do
    expected = ["WIN", "LOSS", "LOSS", "LOSS", "WIN"]
    expect(stat_tracker.filter_by_header(baby_data, :result)).to eq(expected)
    expected = ["home", "away", "home", "away", "home"]
    expect(stat_tracker.filter_by_header(baby_data, :hoa)).to eq(expected)
  end

  it "can filter by criteria" do

    expect(stat_tracker.criteria_filter(baby_data, :result, "LOSS").size).to eq(3)
  end

  # it 'can hash values' do
  #
  #   expect(stat_tracker.hash_by(baby_data, :team_id)).to be true
  # end

  it 'win can count specific row data' do

    expect(stat_tracker.count_hashed_by(game_teams_path, :team_id, '6', "WIN")).to eq 251
  end

  it 'lose can count specific row data' do

    expect(stat_tracker.count_hashed_by(game_teams_path, :team_id, '6', "LOSS")).to eq 150
  end
  it 'tie can count specific row data' do

    expect(stat_tracker.count_hashed_by(game_teams_path, :team_id, '6', "TIE")).to eq 109

  end

  it 'can count wins' do

    expect(stat_tracker.count_wins('6')).to eq 251
  end

  it 'can count losses' do

    expect(stat_tracker.count_losses('6')).to eq 150
  end

  it 'can count ties' do

    expect(stat_tracker.count_ties('6')).to eq 109
  end


end
