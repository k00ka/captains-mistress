class Player
  attr_accessor :game, :ball_colour

  def name
    @name || @ball_colour
  end
end
