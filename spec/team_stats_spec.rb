require './spec/spec_helper'

RSpec.describe TeamStatistics do
 let(:stat_tracker) {StatTracker.new}
 let(:team) {TeamStatistics.new}

 it '1* exists' do

    expect(team).to be_a(TeamStatistics)
  end




end
