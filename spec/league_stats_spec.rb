require './spec/spec_helper'

RSpec.describe 'League' do
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

        require 'pry'; binding.pry
    end

  end
