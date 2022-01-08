require 'csv'
require './lib/games.rb'
require './lib/teams.rb'
require './lib/game_teams.rb'
require './lib/hash_data'
require './lib/league_stats'

class LeagueStats < HashData


  def league_count
    @teams.count
  end

  def best_offense
    
  end


end
