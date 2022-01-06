class Coach
  attr_reader :wins, :games

  def initialize(record)
    @wins = record[:wins]
    @games = record[:games]
  end

  def win_percentage
    @wins.to_f / @games * 100
  end
end
