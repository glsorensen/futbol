class Team
  attr_reader :team_id, :shots, :goals, :tackles

  def initialize(info)
    @team_id = info[:team_id]
    @shots = info[:shots]
    @goals = info[:goals]
    @tackles = info[:tackles]
  end

  def play_game(shots, goals, tackles_num)
    @shots += shots
    @goals += goals
    @tackles += tackles_num
  end

  def goal_percentage
    ((@goals.to_f / @shots) * 100).round(1)
  end
end
