class Coach
  attr_reader :wins, :games

  def initialize(record)
    @wins = record[:wins]
    @games = record[:games]
  end


end
