require 'debugger'
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

def automaton_menu
  puts "Automatons"
  automatons = Automaton.descendants
  automatons.each_with_index { |a,i| puts "#{i+1}. #{a.name}" }
end

def automaton_selection(prompt)
  print "#{[prompt, '>'].join ' '} "
  Automaton.descendants[gets.chomp.to_i-1].new
end

loop do
  print_menu
  choice = gets.chomp
  case choice
  when '1'
    p1 = Human.new
    p2 = Human.new
  when '2'
    automaton_menu
    p1 = Human.new
    p2 = automaton_selection("Player 2")
  when '3'
    automaton_menu
    p1 = automaton_selection("Player 1")
    p2 = automaton_selection("Player 2")
  when 'q'
    exit 0
  end
  game = Game.new(p1, p2)
  game.play if game
end
