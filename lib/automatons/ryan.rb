require './lib/random_gaussian'

# Ryan attempts to create a normal distribution on the board - lots on 4, little on 1,7
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
