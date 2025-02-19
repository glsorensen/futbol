class GameTeams
  attr_reader :game_id,
              :game_id1,
              :team_id,
              :home_or_away,
              :result,
              :head_coach,
              :goals,
              :shots,
              :tackles

  def initialize(data)
    @game_id = data[:game_id]
    @game_id1 = data[:game_id]
    @team_id = data[:team_id]
    @home_or_away = data[:hoa]
    @result = data[:result]
    @settled_in = data[:settled_in]
    @head_coach = data[:head_coach]
    @goals = data[:goals].to_i
    @shots = data[:shots].to_i
    @tackles = data[:tackles].to_i
    # @penalty_minutes = data[:pim]
    # @power_play_opportunities = data[:powerPlayOpportunities]
    # @power_play_goals = data[:powerPlayGoals]
    # @face_off_win_percentage = data[:faceOffWinPercentage]
    # @giveaways = data[:giveaways]
    # @takeaways = data[:takeaways]
  end

end
