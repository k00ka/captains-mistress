class Robin < Automaton
  def prepare_to_play
    @channel = 7
    @played = 0
  end

  def move
    @played += 1
    begin
      @channel += 1
      @channel = 1 if @channel == 8
    end while @game.rack.channel_full?(@channel)
    puts @channel
    @channel
  end
end
