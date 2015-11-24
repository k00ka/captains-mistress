require_relative 'cell'

class Rack

  Empty = Cell::Empty
  Ex = 'x'
  Oh = 'o'

  def initialize
    @rack = [[], [], [], [], [], [], []]
  end

  def print_rack
    puts "1|2|3|4|5|6|7"
    puts expanded_rack.transpose.map { |row| row.join("|") }.reverse
  end

  def rack_full?
    @rack.join.length == 42
  end

  def channel_full?(channel)
    @rack[channel-1].length == 6
  end

  def cell_address(i,j)
    "#{i}#{"FEDCBA"[j]}"
  end

  def playable_cell_address(channel)
    cell_address(channel, @rack[channel-1].length)
  end

  def playable_cells
    (1..7).to_a.reject { |c| channel_full?(c) }.map {|c| playable_cell_address(c) }
  end

  def valid_channel?(channel)
    (1..7).include?(channel) && !channel_full?(channel)
  end

  def drop_ball(symbol, channel)
    @rack[channel-1] << Cell.new(symbol, playable_cell_address(channel))
  end

  def diag_right_rotate(rack)
    rack.transpose.flatten.group_by.with_index { |_,k| k.divmod(rack.size).inject(:+) }.values
  end

  def diag_left_rotate(rack)
    # TODO: find a way to remove the two reverses.
    rack.map(&:reverse).transpose.flatten.group_by.with_index { |_,k| k.divmod(rack.size).inject(:+) }.values.map(&:reverse)
  end

  # direction can be "all", "channel", "row", "diag_right", "diag_left"
  def find_locations(pattern, direction = "all")
    rack = expanded_rack.map(&:reverse)
    patre = /(?=(#{Regexp.quote(pattern)}))/
    patlen = pattern.length
    matches = []

    matches += match(rack, patre, patlen) if %w(channel all).include?(direction)
    matches += match(rack.transpose, patre, patlen) if %w(row all).include?(direction)
    matches += match(diag_right_rotate(rack), patre, patlen) if %w(diag_right all).include?(direction)
    matches += match(diag_left_rotate(rack), patre, patlen) if %w(diag_right all).include?(direction)
    matches
  end

  if Object.const_defined?('RSpec') # effectively, Rails.env.test?
    def set_rack!(rack)
      @rack = rack
      self
    end
  end

private
  def expanded_channel(channel)
    ec = @rack[channel-1].dup
    ec[5] = nil #extend array
    ec.fill { |i| ec[i] || Cell.new(Empty, cell_address(channel, i)) }
  end

  def expanded_rack
    (1..7).map { |ch| expanded_channel(ch) }
  end

  def match(rack, patre, patlen)
    # use strings to find the locations
    strings = rack.map { |cells| cells.join }
    match_begins = strings.map do |str|
      locs = []
      str.scan(patre) { locs << $~.begin(0) }
      locs
    end
    # map strings back into cells
    rack.zip(match_begins).map { |cells,match_begins| match_begins.map { |match_begin| cells[match_begin,patlen] } }.flatten(1)
  end
end
