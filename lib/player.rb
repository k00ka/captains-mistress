class Player
  attr_accessor :game, :team_name

  def name
    @name || @team_name
  end
end
