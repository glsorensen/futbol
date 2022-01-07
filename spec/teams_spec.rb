require './lib/teams'

RSpec.describe 'Teams' do
  let(:teams_data) {'./data/teams.csv'}
  let(:team) {Teams.new(teams_data)}

  it 'exists' do

    expect(team).to be_a(Teams)
  end
end
