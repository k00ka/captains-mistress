#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'rack'

module RackSubject
  def self.fresh
    Rack.new
  end

  def self.channel_2_full
    rack = Rack.new
    rack.set_rack!([[],["x","o","x","o","x","o"],[],[],[],[],[]])
  end

  def self.draw
    rack = Rack.new
    rack.set_rack!([["x","o","x","o","x","o"],["x","o","x","o","x","o"],["x","o","x","o","x","o"],["o","x","o","x","o","x"],["x","o","x","o","x","o"],["x","o","x","o","x","o"],["x","o","x","o","x","o"]])
  end

  def self.two_plays_each
    rack = Rack.new
    rack.set_rack!([["x"],["o","x"],["o"],[],[],[],[]])
  end

  def self.ex_win_horizontal
    rack = Rack.new
    rack.set_rack!([[],["x"],["x"],["x"],["x"],[],[]])
  end

  def self.ex_win_vertical
    rack = Rack.new
    rack.set_rack!([[],[],[],[],[],[],["x","x","x","x"]])
  end

  def self.ex_win_top_left_diagonal
    rack = Rack.new
    rack.set_rack!([["x","o","x","o"],["x","o","x"],["x","o"],["x"],[],[],[]])
  end

  def self.ex_win_top_right_diagonal
    rack = Rack.new
    rack.set_rack!([[],[],[], ["x"], ["x","o"], ["x","o","x"], ["x","o","x","o"]])
  end

  def self.oh_win_horizontal
    rack = Rack.new
    rack.set_rack!([[],["o"],["o"],["o"],["o"],[],[]])
  end

  def self.oh_win_vertical
    rack = Rack.new
    rack.set_rack!([[],[],[],[],[],[],["o","o","o","o"]])
  end

  def self.oh_win_top_left_diagonal
    rack = Rack.new
    rack.set_rack!([["o","x","x","o"],["o","x","o"],["o","x"],["o"],[],[],[]])
  end

  def self.oh_win_top_right_diagonal
    rack = Rack.new
    rack.set_rack!([[],[],[], ["o"], ["x","o"], ["o","x","o"], ["x","o","x","o"]])
  end
end

# The top of your testing block
# More ohamples of tests can be found here: https://github.com/rspec/rspec-ohpectations
describe Rack, "#channel_full?" do
  context "after three plays each, all into channel 2" do
    subject { RackSubject.channel_2_full }
    it "says only channel 2 is full" do
      (1..7).each do |channel|
        expect(subject.channel_full?(channel)).to eql(channel == 2)
      end
    end
  end
  context "full rack, no lines of four" do
    subject { RackSubject.draw }
    it "says all channels are full" do
      (1..7).each do |channel|
        expect(subject.channel_full?(channel)).to eql(true)
      end
    end
  end
  context "after two plays each" do
    subject { RackSubject.two_plays_each }
    it "says no channels are full" do
      (1..7).each do |channel|
        expect(subject.channel_full?(channel)).to eql(false)
      end
    end
  end
  context "fresh rack" do
    subject { RackSubject.fresh }
    it "says no channels are full" do
      (1..7).each do |channel|
        expect(subject.channel_full?(channel)).to eql(false)
      end
    end
  end
end

describe Rack, "#rack_full?" do
  context "after three plays each, all into channel 2" do
    subject { RackSubject.channel_2_full }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "full rack, no lines of four" do
    subject { RackSubject.draw }
    it "says the rack is full" do
      expect(subject.rack_full?).to eql(true)
    end
  end
  context "after two plays each" do
    subject { RackSubject.two_plays_each }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "fresh rack" do
    subject { RackSubject.fresh }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "ex win horizontal" do
    subject { RackSubject.ex_win_horizontal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "ex win vertical" do
    subject { RackSubject.ex_win_vertical }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "ex win top left diagonal" do
    subject { RackSubject.ex_win_top_left_diagonal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "ex win top right diagonal" do
    subject { RackSubject.ex_win_top_right_diagonal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "oh win horizontal" do
    subject { RackSubject.oh_win_horizontal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "oh win vertical" do
    subject { RackSubject.oh_win_vertical }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "oh win top left diagonal" do
    subject { RackSubject.oh_win_top_left_diagonal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
  context "oh win top right diagonal" do
    subject { RackSubject.oh_win_top_right_diagonal }
    it "says the rack is not full" do
      expect(subject.rack_full?).to eql(false)
    end
  end
end
  
describe Rack, "#valid_channel?" do
  context "after three plays each, all into channel 2" do
    subject { RackSubject.channel_2_full }
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
    subject { RackSubject.draw }
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
    subject { RackSubject.two_plays_each }
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
  context "fresh rack" do
    subject { RackSubject.fresh }
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

describe Rack, "playable_cells" do
  context "fresh rack" do
    subject { RackSubject.fresh }
    it "returns the bottom row" do
      expect(subject.playable_cells).to eql(["1F","2F","3F","4F","5F","6F","7F"])
    end
  end
end
