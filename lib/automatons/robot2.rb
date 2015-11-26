class Robot2 < Automaton
  def prepare_to_play
    @channel = 1
  end

  def move
    opponent = get_opponent_cell

    if we_can_win?
      win!

      puts @channel
      return @channel
    end

    if opponent_can_win?(opponent) && can_block?(opponent)
      block_opponent(opponent)

      puts @channel
      return @channel
    end

    while @game.rack.channel_full?(@channel)
      @channel +=  1
      @channel = 1 if @channel > 7
    end

    puts @channel
    @channel
  end

  private

  def get_opponent_cell
    team_cell = {
      "ex" => "o",
      "oh" => "x"
    }
    team_cell[team_name]
  end

  def we_can_win?
    return false unless winning_patterns_for(get_our_cell).any?

    winning_pattern = winning_patterns_for(get_our_cell).first
    (winning_pattern.map(&:address) & @game.rack.playable_cells).any?
  end

  def win!
    winning_pattern = winning_patterns_for(get_our_cell).first

    winning_cell = (winning_pattern.map(&:address) & @game.rack.playable_cells).first

    @channel = winning_cell[0].to_i
  end

  def get_our_cell
    our_cell = {
      "ex" => "x",
      "oh" => "o"
    }
    our_cell[team_name]
  end

  def opponent_can_win?(opponent)
    winning_patterns_for(opponent).any?
  end

  def can_block?(opponent)
    cell_to_block(opponent)
  end

  def block_opponent(opponent)
    blocking_cell = cell_to_block(opponent)

    @channel = blocking_cell[0].to_i
  end

  def cell_to_block(opponent)
    winning_pattern = winning_patterns_for(opponent).first

    (winning_pattern.map(&:address) & @game.rack.playable_cells).first
  end

  def winning_patterns_for(x_or_o)
    [
      "#{x_or_o}#{x_or_o}#{x_or_o} ",
      "#{x_or_o}#{x_or_o} #{x_or_o}",
      "#{x_or_o} #{x_or_o}#{x_or_o}",
      " #{x_or_o}#{x_or_o}#{x_or_o}"
    ].reduce([]) do |acc, winning_pattern|
      acc.concat @game.rack.find_locations(winning_pattern)
    end
  end
end
