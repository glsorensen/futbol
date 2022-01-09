class Coach
  attr_reader :name, :wins, :games

  def initialize(record)
    @name = record[:name]
    @wins = record[:wins]
    @games = record[:games]
  end

  def play_game(result)
    @games += 1
    @wins += 1 if result == "WIN"
  end

  def win_percentage
    (@wins.to_f / @games) * 100
  end
end
