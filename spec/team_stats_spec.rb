require './spec/spec_helper'

RSpec.describe TeamStatistics do
 let(:stat_tracker) {StatTracker.new}
 let(:team) {TeamStatistics.new}

 it '1* exists' do

    expect(team).to be_a(TeamStatistics)
  end

  # it '2* can hash teams by given criteria' do
  #   expected = {
  #     "team_id" => "18",
  #     "franchise_id" => "34",
  #     "team_name" => "Minnesota United FC",
  #     "abbreviation" => "MIN",
  #     "link" => "/api/v1/teams/18"
  #   }
  #   expect(team.team_info).to include(expected)
  # end

  
end
