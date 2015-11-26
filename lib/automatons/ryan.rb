require './lib/random_gaussian'

class Ryan < Automaton
  def prepare_to_play
    @dist = RandomGaussian.new(4,1)
  end

  def move
    begin
      channel = @dist.rand.round
    end while @game.rack.channel_full?(channel)
    puts channel
    channel
  end
end
