class Automaton < Player
  def initialize(name = nil)
    @name = name || "George"
  end

  def move
    begin
      channel = (rand * 7 + 1).floor
    end while @game.channel_full?(channel)
    puts channel
    channel
  end
end
