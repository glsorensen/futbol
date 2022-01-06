require './lib/coach'

RSpec.describe 'coach' do
  let(:coach) {Coach.new({name:"Gunnar", wins:5, games:10})}

  it "exists" do
    expect(coach).to be_a Coach
  end

  it "initializes" do
    expect(coach.name).to eq("Gunnar")
    expect(coach.wins).to eq(5)
    expect(coach.games).to eq(10)
  end

  it "can add one to games" do
    coach.add_game
    expect(coach.games).to eq(11)
  end

  it "can add one to wins" do
    coach.add_win
    expect(coach.wins).to eq(11)
  end

  it "calculates win percentage" do
    expect(coach.win_percentage).to eq(50.0)
  end
end
