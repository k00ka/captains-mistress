class George < Automaton
  def move
    begin
      channel = (rand * 7 + 1).floor
    end while @game.rack.channel_full?(channel)
    puts channel
    channel
  end
end
