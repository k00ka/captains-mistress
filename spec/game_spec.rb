#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'game'

module GameSubject
  def self.fresh
    Game.new(Player.new, Player.new)
  end

  def self.channel_2_full
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.channel_2_full
    game
  end

  def self.draw
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.draw
    game
  end

  def self.two_plays_each
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.two_plays_each
    game
  end

  def self.ex_win_horizontal
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.ex_win_horizontal
    game
  end

  def self.ex_win_vertical
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.ex_win_vertical
    game
  end

  def self.ex_win_top_left_diagonal
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.ex_win_top_left_diagonal
    game
  end

  def self.ex_win_top_right_diagonal
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.ex_win_top_right_diagonal
    game
  end

  def self.oh_win_horizontal
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.oh_win_horizontal
    game
  end

  def self.oh_win_vertical
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.oh_win_vertical
    game
  end

  def self.oh_win_top_left_diagonal
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.oh_win_top_left_diagonal
    game
  end

  def self.oh_win_top_right_diagonal
    game = Game.new(Player.new, Player.new)
    game.rack = RackSubject.oh_win_top_right_diagonal
    game
  end
end

# The top of your testing block
# More ehamples of tests can be found here: https://github.com/rspec/rspec-ohpectations
describe Game, "#game_over?" do
  context "after three plays each, all into channel 2" do
    subject { GameSubject.channel_2_full }
    it "says the game is not over" do
      expect(subject.game_over?).to eql(false)
    end
  end
  context "full rack, no lines of four" do
    subject { GameSubject.draw }
    it "says game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "after two plays each" do
    subject { GameSubject.two_plays_each }
    it "says the game is not over" do
      expect(subject.game_over?).to eql(false)
    end
  end
  context "fresh game" do
    subject { GameSubject.fresh }
    it "says the game is not over" do
      expect(subject.game_over?).to eql(false)
    end
  end
  context "ex win horizontal" do
    subject { GameSubject.ex_win_horizontal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "ex win vertical" do
    subject { GameSubject.ex_win_vertical }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "ex win top left diagonal" do
    subject { GameSubject.ex_win_top_left_diagonal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "ex win top right diagonal" do
    subject { GameSubject.ex_win_top_right_diagonal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "oh win horizontal" do
    subject { GameSubject.oh_win_horizontal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "oh win vertical" do
    subject { GameSubject.oh_win_vertical }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "oh win top left diagonal" do
    subject { GameSubject.oh_win_top_left_diagonal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
  context "oh win top right diagonal" do
    subject { GameSubject.oh_win_top_right_diagonal }
    it "says the game is over" do
      expect(subject.game_over?).to eql(true)
    end
  end
end
  
describe Game, "#winner?" do
  context "after three plays each, all into channel 2" do
    subject { GameSubject.channel_2_full }
    it "says there is no winner" do
      expect(subject.winner?).to eql(false)
    end
  end
  context "full rack, no lines of four" do
    subject { GameSubject.draw }
    it "says there is no winner" do
      expect(subject.winner?).to eql(false)
    end
  end
  context "after two plays each" do
    subject { GameSubject.two_plays_each }
    it "says there is no winner" do
      expect(subject.winner?).to eql(false)
    end
  end
  context "fresh game" do
    subject { GameSubject.fresh }
    it "says there is no winner" do
      expect(subject.winner?).to eql(false)
    end
  end
  context "ex win horizontal" do
    subject { GameSubject.ex_win_horizontal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "ex win vertical" do
    subject { GameSubject.ex_win_vertical }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "ex win top left diagonal" do
    subject { GameSubject.ex_win_top_left_diagonal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "ex win top right diagonal" do
    subject { GameSubject.ex_win_top_right_diagonal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "oh win horizontal" do
    subject { GameSubject.oh_win_horizontal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "oh win vertical" do
    subject { GameSubject.oh_win_vertical }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "oh win top left diagonal" do
    subject { GameSubject.oh_win_top_left_diagonal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
  context "oh win top right diagonal" do
    subject { GameSubject.oh_win_top_right_diagonal }
    it "says there is a winner" do
      expect(subject.winner?).to eql(true)
    end
  end
end

describe Game, "#winner" do
  context "after three plays each, all into channel 2" do
    subject { GameSubject.channel_2_full }
    it "says no one has won" do
      expect(subject.winner).to eql(nil)
    end
  end
  context "full rack, no lines of four" do
    subject { GameSubject.draw }
    it "says no one has won" do
      expect(subject.winner).to eql(nil)
    end
  end
  context "after two plays each" do
    subject { GameSubject.two_plays_each }
    it "says no one has won" do
      expect(subject.winner).to eql(nil)
    end
  end
  context "fresh game" do
    subject { GameSubject.fresh }
    it "says no one has won" do
      expect(subject.winner).to eql(nil)
    end
  end
  context "ex win horizontal" do
    subject { GameSubject.ex_win_horizontal }
    it "says Ex has won" do
      expect(subject.winner).to eql("ex")
    end
  end
  context "ex win vertical" do
    subject { GameSubject.ex_win_vertical }
    it "says Ex has won" do
      expect(subject.winner).to eql("ex")
    end
  end
  context "ex win top left diagonal" do
    subject { GameSubject.ex_win_top_left_diagonal }
    it "says Ex has won" do
      expect(subject.winner).to eql("ex")
    end
  end
  context "ex win top right diagonal" do
    subject { GameSubject.ex_win_top_right_diagonal }
    it "says Ex has won" do
      expect(subject.winner).to eql("ex")
    end
  end
  context "oh win horizontal" do
    subject { GameSubject.oh_win_horizontal }
    it "says Oh has won" do
      expect(subject.winner).to eql("oh")
    end
  end
  context "oh win vertical" do
    subject { GameSubject.oh_win_vertical }
    it "says Oh has won" do
      expect(subject.winner).to eql("oh")
    end
  end
  context "oh win top left diagonal" do
    subject { GameSubject.oh_win_top_left_diagonal }
    it "says Oh has won" do
      expect(subject.winner).to eql("oh")
    end
  end
  context "oh win top right diagonal" do
    subject { GameSubject.oh_win_top_right_diagonal }
    it "says Oh has won" do
      expect(subject.winner).to eql("oh")
    end
  end
end
