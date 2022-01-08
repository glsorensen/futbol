require './lib/team'

RSpec.describe do
  let(:team) {Team.new({team_id: 4, shots: 9, goals: 5})}

  it "exists" do
    expect(team).to be_a Team
  end

  it "initializes" do
    expect(team.team_id).to eq 4
    expect(team.shots).to eq 9
    expect(team.goals).to eq 5
  end

  it "can record game data" do
    team.play_game(4, 2)
    expect(team.shots).to eq(13)
    expect(team.goals).to eq(7)
  end

  it "calculates win percentage" do
    expect(team.win_percentage).to eq(55.6)
  end
end
