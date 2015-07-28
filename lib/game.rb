class Game
  def initialize(player1, player2)
    @white_player, @black_player = randomize_players(player1, player2)
  end

  def winner?
    false
  end

private
  def randomize_players(p1, p2)
  end
end
