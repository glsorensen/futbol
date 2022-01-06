require './lib/coach'

RSpec.describe 'coach' do
  let(:coach) {Coach.new({wins:0, games:0})}

  it "exists" do
    expect(coach).to be_a Coach
  end

  it "initializes" do
    expect(coach.wins).to eq(0)
    expect(coach.games).to eq(0)
  end
end
