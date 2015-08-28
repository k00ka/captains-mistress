class Rack

  def initialize
    @rack = [[], [], [], [], [], [], []]
  end

  def find_locations(pattern)
    expanded_rack = @rack.map { |ch| ch.dup.fill(" ", ch.length..5) }

    channel_strings = expanded_rack.map { |ch| ch.join }
    return true if channel_strings.any? { |ch| ch.include? pattern }

    row_strings = expanded_rack.transpose.map { |row| row.join.strip }
    return true if row_strings.any? { |row| row.include? pattern }

    diagonal_right_strings = expanded_rack.each_with_index.map { |ch,i| ch[[3-i,0].max..[8-i,5].min].push(*[" "] * [3-i,0].max).unshift(*[" "] * [i-3,0].max) }.transpose.map { |diag| diag.join.strip }
    return true if diagonal_right_strings.any? { |diag| diag.include? pattern }

    diagonal_left_strings = expanded_rack.each_with_index.map { |ch,i| ch[[i-3,0].max..[i+2,5].min].unshift(*[" "] * [3-i,0].max).push(*[" "] * [i-3,0].max) }.transpose.map { |diag| diag.join.strip }
    return true if diagonal_left_strings.any? { |diag| diag.include? pattern }

    false
  end

  def playable_cells
    cells = []
    (0..6).each do |channel|
      cells << "#{channel + 1}#{"FEDCBA"[@rack[channel].length]}" unless channel_full?(channel)
    end
    cells
  end

  if Object.const_defined?('RSpec') # effectively, Rails.env.test?
    def set_rack!(rack)
      @rack = rack
      self
    end
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

  def valid_channel?(channel)
    (1..7).include?(channel) && !channel_full?(channel)
  end

  def drop_ball(symbol, channel)
    @rack[channel-1] << symbol
  end
end
