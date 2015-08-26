#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'game'
require 'player'

def fresh_game
  game = Game.new(Player.new, Player.new)
end

def channel_2_full
  game = Game.new(Player.new, Player.new)
  game.set_rack!([[],["x","o","x","o","x","o"],[],[],[],[],[]])
end

def draw
  game = Game.new(Player.new, Player.new)
  game.set_rack!([["x","o","x","o","x","o"],["x","o","x","o","x","o"],["x","o","x","o","x","o"],["o","x","o","x","o","x"],["x","o","x","o","x","o"],["x","o","x","o","x","o"],["x","o","x","o","x","o"]])
end

def two_plays_each
  game = Game.new(Player.new, Player.new)
  game.set_rack!([["x"],["o","x"],["o"],[],[],[],[]])
end

def ex_win_horizontal
  game = Game.new(Player.new, Player.new)
  game.set_rack!([[],["x"],["x"],["x"],["x"],[],[]])
end

def ex_win_vertical
  game = Game.new(Player.new, Player.new)
  game.set_rack!([[],[],[],[],[],[],["x","x","x","x"]])
end

def ex_win_top_left_diagonal
  game = Game.new(Player.new, Player.new)
  game.set_rack!([["x","o","x","o"],["x","o","x"],["x","o"],["x"],[],[],[]])
end

def ex_win_top_right_diagonal
  game = Game.new(Player.new, Player.new)
  game.set_rack!([[],[],[], ["x"], ["x","o"], ["x","o","x"], ["x","o","x","o"]])
end

def oh_win_horizontal
  game = Game.new(Player.new, Player.new)
  game.set_rack!([[],["o"],["o"],["o"],["o"],[],[]])
end

def oh_win_vertical
  game = Game.new(Player.new, Player.new)
  game.set_rack!([[],[],[],[],[],[],["o","o","o","o"]])
end

def oh_win_top_left_diagonal
  game = Game.new(Player.new, Player.new)
  game.set_rack!([["o","x","x","o"],["o","x","o"],["o","x"],["o"],[],[],[]])
end

def oh_win_top_right_diagonal
  game = Game.new(Player.new, Player.new)
  game.set_rack!([[],[],[], ["o"], ["x","o"], ["o","x","o"], ["x","o","x","o"]])
end

# The top of your testing block
# More ohamples of tests can be found here: https://github.com/rspec/rspec-ohpectations
describe Game, "#channel_full?" do
  context "after three plays each, all into channel 2" do
    subject { channel_2_full }
    it "says only channel 2 is full" do
      (1..7).each do |channel|
        expect(subject.channel_full?(channel)).to eql(channel == 2)
      end
    end
  end
  context "full rack, no lines of four" do
    subject { draw }
    it "says all channels are full" do
      (1..7).each do |channel|
        expect(subject.channel_full?(channel)).to eql(true)
      end
    end
  end
  context "after two plays each" do
    subject { two_plays_each }
    it "says no channels are full" do
      (1..7).each do |channel|
        expect(subject.channel_full?(channel)).to eql(false)
      end
    end
  end
  context "fresh game" do
    subject { fresh_game }
    it "says no channels are full" do
      (1..7).each do |channel|
        expect(subject.channel_full?(channel)).to eql(false)
      end
    end
  end
end

describe Game, "#game_over?" do
  context "after three plays each, all into channel 2" do
    subject { channel_2_full }
    it "says the game is not over" do
      expect(subject.game_over?).to eql(false)
    end
  end
  context "full rack, no lines of four" do
    subject { draw }
    it "says game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "after two plays each" do
    subject { two_plays_each }
    it "says the game is not over" do
      expect(subject.game_over?).to eql(false)
    end
  end
  context "fresh game" do
    subject { fresh_game }
    it "says the game is not over" do
      expect(subject.game_over?).to eql(false)
    end
  end
  context "ex win horizontal" do
    subject { ex_win_horizontal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "ex win vertical" do
    subject { ex_win_vertical }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "ex win top left diagonal" do
    subject { ex_win_top_left_diagonal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "ex win top right diagonal" do
    subject { ex_win_top_right_diagonal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "oh win horizontal" do
    subject { oh_win_horizontal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "oh win vertical" do
    subject { oh_win_vertical }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "oh win top left diagonal" do
    subject { oh_win_top_left_diagonal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "oh win top right diagonal" do
    subject { oh_win_top_right_diagonal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
end
  
describe Game, "#rack_full?" do
  context "after three plays each, all into channel 2" do
    subject { channel_2_full }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "full rack, no lines of four" do
    subject { draw }
    it "says the rack is full" do
      expect(subject.rack_full?).to eql(true)
    end
  end
  context "after two plays each" do
    subject { two_plays_each }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "fresh game" do
    subject { fresh_game }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "ex win horizontal" do
    subject { ex_win_horizontal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "ex win vertical" do
    subject { ex_win_vertical }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "ex win top left diagonal" do
    subject { ex_win_top_left_diagonal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "ex win top right diagonal" do
    subject { ex_win_top_right_diagonal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "oh win horizontal" do
    subject { oh_win_horizontal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "oh win vertical" do
    subject { oh_win_vertical }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "oh win top left diagonal" do
    subject { oh_win_top_left_diagonal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "oh win top right diagonal" do
    subject { oh_win_top_right_diagonal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
end
  
describe Game, "#valid_channel?" do
  context "after three plays each, all into channel 2" do
    subject { channel_2_full }
    it "says all channels except 2 are valid" do
      (1..7).each do |channel|
        expect(subject.valid_channel?(channel)).to eql(channel != 2)
      end
    end
    it "says bogus channels are invalid" do
        expect(subject.valid_channel?(0)).to eql(false)
        expect(subject.valid_channel?(8)).to eql(false)
        expect(subject.valid_channel?("a")).to eql(false)
    end
  end
  context "full rack, no lines of four" do
    subject { draw }
    it "says no channels are valid" do
      (1..7).each do |channel|
        expect(subject.valid_channel?(channel)).to eql(false)
      end
    end
    it "says bogus channels are invalid" do
        expect(subject.valid_channel?(0)).to eql(false)
        expect(subject.valid_channel?(8)).to eql(false)
        expect(subject.valid_channel?("a")).to eql(false)
    end
  end
  context "after two plays each" do
    subject { two_plays_each }
    it "says all channels are valid" do
      (1..7).each do |channel|
        expect(subject.valid_channel?(channel)).to eql(true)
      end
    end
    it "says bogus channels are invalid" do
        expect(subject.valid_channel?(0)).to eql(false)
        expect(subject.valid_channel?(8)).to eql(false)
        expect(subject.valid_channel?("a")).to eql(false)
    end
  end
  context "fresh game" do
    subject { fresh_game }
    it "says all channels are valid" do
      (1..7).each do |channel|
        expect(subject.valid_channel?(channel)).to eql(true)
      end
    end
    it "says bogus channels are invalid" do
        expect(subject.valid_channel?(0)).to eql(false)
        expect(subject.valid_channel?(8)).to eql(false)
        expect(subject.valid_channel?("a")).to eql(false)
    end
  end
end

describe Game, "#winner?" do
  context "after three plays each, all into channel 2" do
    subject { channel_2_full }
    it "says there is no winner" do
      expect(subject.winner?).to eql(false)
    end
  end
  context "full rack, no lines of four" do
    subject { draw }
    it "says there is no winner" do
      expect(subject.winner?).to eql(false)
    end
  end
  context "after two plays each" do
    subject { two_plays_each }
    it "says there is no winner" do
      expect(subject.winner?).to eql(false)
    end
  end
  context "fresh game" do
    subject { fresh_game }
    it "says there is no winner" do
      expect(subject.winner?).to eql(false)
    end
  end
  context "ex win horizontal" do
    subject { ex_win_horizontal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "ex win vertical" do
    subject { ex_win_vertical }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "ex win top left diagonal" do
    subject { ex_win_top_left_diagonal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "ex win top right diagonal" do
    subject { ex_win_top_right_diagonal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "oh win horizontal" do
    subject { oh_win_horizontal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "oh win vertical" do
    subject { oh_win_vertical }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "oh win top left diagonal" do
    subject { oh_win_top_left_diagonal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "oh win top right diagonal" do
    subject { oh_win_top_right_diagonal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
end

describe Game, "#winner" do
  context "after three plays each, all into channel 2" do
    subject { channel_2_full }
    it "says no one has won" do
      expect(subject.winner).to eql(nil)
    end
  end
  context "full rack, no lines of four" do
    subject { draw }
    it "says no one has won" do
      expect(subject.winner).to eql(nil)
    end
  end
  context "after two plays each" do
    subject { two_plays_each }
    it "says no one has won" do
      expect(subject.winner).to eql(nil)
    end
  end
  context "fresh game" do
    subject { fresh_game }
    it "says no one has won" do
      expect(subject.winner).to eql(nil)
    end
  end
  context "ex win horizontal" do
    subject { ex_win_horizontal }
    it "says Ex has won" do
      expect(subject.winner).to eql("ex")
    end
  end
  context "ex win vertical" do
    subject { ex_win_vertical }
    it "says Ex has won" do
      expect(subject.winner).to eql("ex")
    end
  end
  context "ex win top left diagonal" do
    subject { ex_win_top_left_diagonal }
    it "says Ex has won" do
      expect(subject.winner).to eql("ex")
    end
  end
  context "ex win top right diagonal" do
    subject { ex_win_top_right_diagonal }
    it "says Ex has won" do
      expect(subject.winner).to eql("ex")
    end
  end
  context "oh win horizontal" do
    subject { oh_win_horizontal }
    it "says Oh has won" do
      expect(subject.winner).to eql("oh")
    end
  end
  context "oh win vertical" do
    subject { oh_win_vertical }
    it "says Oh has won" do
      expect(subject.winner).to eql("oh")
    end
  end
  context "oh win top left diagonal" do
    subject { oh_win_top_left_diagonal }
    it "says Oh has won" do
      expect(subject.winner).to eql("oh")
    end
  end
  context "oh win top right diagonal" do
    subject { oh_win_top_right_diagonal }
    it "says Oh has won" do
      expect(subject.winner).to eql("oh")
    end
  end
end
