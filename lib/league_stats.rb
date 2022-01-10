require './spec/spec_helper'
require './lib/hash_data'

class LeagueStats < HashData


  def league_count
    @teams.count
  end




end
