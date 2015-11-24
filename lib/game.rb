# encoding: utf-8

require_relative 'rack'
require_relative 'player'

class Game
  attr_reader :rack

  if Object.const_defined?('RSpec') # effectively, Rails.env.test?
    attr_writer :rack
  end

  def initialize(player1, player2)
    @rack = Rack.new
    @ex_player, @oh_player = randomize_players(player1, player2)
    setup_player(@ex_player, "ex")
    setup_player(@oh_player, "oh")
  end

  def game_over?
    winner? || @rack.rack_full?
  end

  def winner?
    winner != nil
  end

  def winner
    return @winner if @winner
    ex_winner_pattern = "xxxx"
    oh_winner_pattern = "oooo"
    
    return @winner = @ex_player unless @rack.find_locations(ex_winner_pattern).empty?
    return @winner = @oh_player unless @rack.find_locations(oh_winner_pattern).empty?
    nil
  end

  def play
    @rack.print_rack
    loop do
      take_turn(@ex_player)
      @rack.print_rack
      break if game_over?

      take_turn(@oh_player)
      @rack.print_rack
      break if game_over?
    end
    if winner?
      puts "The winner is #{winner.name} (#{winner.team_name})!"
    else
      puts "It was a draw."
    end
  end

private
  def randomize_players(p1, p2)
    (rand < 0.5) ? [ p1, p2 ] : [ p2, p1 ]
  end

  def take_turn(player)
    prompt = "Your move, #{player.name}: "
    print prompt
    while channel = player.move
      break if @rack.valid_channel?(channel)
      puts "You can't play a piece there."
      print prompt
    end
    drop_ball(player.team_name, channel)
  end

  def drop_ball(team_name, channel)
    @rack.drop_ball(symbol_for(team_name), channel)
  end

  def symbol_for(team_name)
    case team_name
    when "ex"
      Rack::Ex
    when "oh"
      Rack::Oh
    else
      Rack::Empty
    end
  end

  def setup_player(player, team_name)
    player.team_name = team_name
    player.game = self
  end
end
