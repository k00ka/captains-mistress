#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'game'
require 'player'

def fresh_game
  Game.new(Player.new, Player.new)
end

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe Game, "#winner?" do

  context "fresh_game" do
    it "indicates no winner" do
      expect(fresh_game.winner?).to eql(false)
    end
  end
  
  # more tests go here
end
