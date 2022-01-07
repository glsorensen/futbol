class Team
  attr_reader :team_id, :shots, :goals

  def initialize(info)
    @team_id = info[:team_id]
    @shots = info[:shots]
    @goals = info[:goals]
  end



end
