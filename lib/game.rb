# encoding: utf-8

class Game
  def initialize(player1, player2)
    @rack = [[], [], [], [], [], [], []]
    @ex_player, @oh_player = randomize_players(player1, player2)
    setup_player(@ex_player, "ex")
    setup_player(@oh_player, "oh")
  end

  def setup_player(player, ball_colour)
    player.ball_colour = ball_colour
    player.game = self
  end

  def super_special_hidden_rack_setting_method(rack)
    @rack = rack
  end

  def rack_full?
    @rack.join.length == 42
  end

  def channel_full?(channel)
    @rack[channel-1].length == 6
  end

  def print_rack
    puts "1|2|3|4|5|6|7"
    puts @rack.map { |channel| channel.dup.fill(" ", channel.length..5) }.transpose.map{ |row| row.join("|") }.reverse
  end

  def game_over?
    winner? || rack_full?
  end

  def winner?
    !winner.nil?
  end

  def winner
    ex_winners = "xxxx"
    oh_winners = "oooo"
    channel_strings = @rack.map { |ch| ch.join }
    return "ex" if channel_strings.any? { |ch| ch.include? ex_winners }
    return "oh" if channel_strings.any? { |ch| ch.include? oh_winners }
    expanded_rack = @rack.map { |ch| ch.dup.fill(" ", ch.length..5) }
    row_strings = expanded_rack.transpose.map { |row| row.join.strip }
    return "ex" if row_strings.any? { |row| row.include? ex_winners }
    return "oh" if row_strings.any? { |row| row.include? oh_winners }
    diagonal_right_strings = expanded_rack.each_with_index.map { |ch,i| ch[[3-i,0].max..[8-i,5].min].push(*[" "] * [3-i,0].max).unshift(*[" "] * [i-3,0].max) }.transpose.map { |diag| diag.join.strip }
    return "ex" if diagonal_right_strings.any? { |diag| diag.include? ex_winners }
    return "oh" if diagonal_right_strings.any? { |diag| diag.include? oh_winners }
    diagonal_left_strings = expanded_rack.each_with_index.map { |ch,i| ch[[i-3,0].max..[i+2,5].min].unshift(*[" "] * [3-i,0].max).push(*[" "] * [i-3,0].max) }.transpose.map { |diag| diag.join.strip }
    return "ex" if diagonal_left_strings.any? { |diag| diag.include? ex_winners }
    return "oh" if diagonal_left_strings.any? { |diag| diag.include? oh_winners }
  end

  def symbol_for(ball_colour)
    case ball_colour
    when "ex"
      "x"
    when "oh"
      "o"
    else
      " "
    end
  end

  def drop_ball(ball_colour, channel)
    @rack[channel-1] << symbol_for(ball_colour)
  end

  def valid_channel?(channel)
    (1..7).include?(channel) && !channel_full?(channel)
  end

  def take_turn(player)
    begin
      print "Your move, #{player.name}: "
      channel = player.move
    end until valid_channel?(channel)
    drop_ball(player.ball_colour, channel)
  end

  def play
    loop do
      take_turn(@ex_player)
      print_rack
      break if game_over?

      take_turn(@oh_player)
      print_rack
      break if game_over?
    end
    if winner?
      puts "The winner is #{winner}!"
    else
      puts "It was a draw."
    end
  end

private
  def randomize_players(p1, p2)
    (rand < 0.5) ? [ p1, p2 ] : [ p2, p1 ]
  end
end
