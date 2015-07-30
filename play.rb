require './lib/game'
require './lib/player'
require './lib/human'
require './lib/automaton'

def print_menu
  puts "------------"
  puts "Who is playing? (q to quit)"
  puts "1. Two humans"
  puts "2. Man versus Machine"
  puts "3. Nothing but silicon"
  print "> "
end

loop do
  print_menu
  choice = gets.chomp
  case choice
  when '1'
    game = Game.new(Human.new, Human.new)
  when '2'
    game = Game.new(Human.new, Automaton.new)
  when '3'
    game = Game.new(Automaton.new, Automaton.new)
  when 'q'
    exit 0
  end
  game.play if game
end
