module GameStatsable

  def total_goals_each_game
    all_home_goals = @games[:away_goals].map(&:to_i)
    all_away_goals = @games[:home_goals].map(&:to_i)
    goals_grouped_by_game = all_home_goals.zip(all_away_goals)
    goals_grouped_by_game.map(&:sum)
  end

  def select_home_games_float
    @game_teams.select {|value| value[:hoa] == "home"}.count.to_f
  end
end
