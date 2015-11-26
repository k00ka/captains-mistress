require 'byebug'
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
  puts "4. Toggle Match Mode [#{@match_mode ? "on" : "off"}]"
  print "> "
end

def automaton_menu
  puts "Automatons"
  automatons = Automaton.descendants
  automatons.each_with_index { |a,i| puts "#{i+1}. #{a.name}" }
end

def automaton_selection(prompt)
  begin
    print "#{[prompt, '>'].join ' '} "
    robot = Automaton.descendants[gets.chomp.to_i-1]
    end while robot.nil?
  robot.new
end

loop do
  match_score = Hash.new(0)
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
  when '4'
    @match_mode = !@match_mode
  when 'q'
    exit 0
  end
  if p1 && p2
    games_to_play = @match_mode ? 15 : 1
    games_to_play.times do |game_number|
      puts "Game #{game_number} begins..."
      p1.prepare_to_play
      p2.prepare_to_play
      game = Game.new(p1, p2)
      game.play
      match_score[game.winner] += 1
    end
    if @match_mode
      puts "==========="
      puts "Match score"
      puts "==========="
      puts match_score.map { |k,v| "#{k.name}: #{v}" }.join("\n")
      puts "==========="
    end
  end
end
