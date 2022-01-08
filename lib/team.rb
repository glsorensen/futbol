class Team
  attr_reader :team_id, :shots, :goals

  def initialize(info)
    @team_id = info[:team_id]
    @shots = info[:shots]
    @goals = info[:goals]
  end

  def play_game(shots, goals)
    @shots += shots
    @goals += goals
  end

  def win_percentage
    ((@goals.to_f / @shots) * 100).round(1)
  end

end
