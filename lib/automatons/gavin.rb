class Gavin < Automaton
  def prepare_to_play
    @channel = 1
  end

  def move
    while @game.rack.channel_full?(@channel)
      @channel += 1
    end
    puts @channel
    @channel
  end
end
