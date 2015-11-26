class Robot1 < Automaton
  def prepare_to_play
    @channel = 1
  end

  def move
    opponent = get_opponent_cell

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

  def opponent_can_win?(opponent)
    opponent_winning_patterns(opponent).any?
  end

  def can_block?(opponent)
    cell_to_block(opponent)
  end

  def block_opponent(opponent)
    blocking_cell = cell_to_block(opponent)

    @channel = blocking_cell[0].to_i
  end

  def cell_to_block(opponent)
    winning_pattern = opponent_winning_patterns(opponent).first

    (winning_pattern.map(&:address) & @game.rack.playable_cells).first
  end

  def opponent_winning_patterns(opponent)
    [
      "#{opponent}#{opponent}#{opponent} ",
      "#{opponent}#{opponent} #{opponent}",
      "#{opponent} #{opponent}#{opponent}",
      " #{opponent}#{opponent}#{opponent}"
    ].reduce([]) do |acc, winning_pattern|
      acc.concat @game.rack.find_locations(winning_pattern)
    end
  end
end
