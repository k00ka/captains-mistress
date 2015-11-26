class ABCDE < Automaton

  def prepare_to_play
    @channel = 1
  end

  def move
    begin

      @icon = @team_name == 'ex' ? 'x' : 'o'
      #p "icon: #{@icon}"

      actual_winning_moves = last_move(true)
      actual_losing_moves = last_move(false)


      almost_winning_moves = almost_last_move(true)
      almost_losing_moves = almost_last_move(false)

      if actual_winning_moves.size > 0
        @channel = actual_winning_moves.first[0].to_i
        #p "WINNNNNNN #{@channel}"
      elsif actual_losing_moves.size > 0
        @channel = actual_losing_moves.first[0].to_i
        #p "DONT LOSE #{@channel}"
      elsif almost_winning_moves.size > 0
        @channel = almost_winning_moves.first[0].to_i
        #p "WINNNNNNN #{@channel}"
      elsif almost_losing_moves.size > 0
        @channel = almost_losing_moves.first[0].to_i
      elsif is_column_available?(4)
        @channel = 4
      elsif is_column_available?(3)
        @channel = 3
      elsif is_column_available?(5)
        @channel = 5
      elsif is_column_available?(2)
        @channel = 2
      elsif is_column_available?(6)
        @channel = 6
      else
        @channel = (rand * 7 + 1).floor
        #p "DEFFFFFF #{@channel}"
      end
    end while @game.rack.channel_full?(@channel)

    # required code
    puts @channel
    @channel
  end

  def is_column_available?(column)
    playable_cells = @game.rack.playable_cells
    available = playable_cells & ["#{column}A", "#{column}B", "#{column}C", "#{column}D", "#{column}E", "#{column}F", "#{column}G"]
    available.size > 0
  end

  def last_move(want_to_win)
    patterns = create_patterns(want_to_win)

    play_moves(patterns)
  end

  def almost_last_move(want_to_win)
    patterns = create_almost_patterns(want_to_win)

    play_moves(patterns)
  end

  def play_moves(patterns)
    winning_moves = []

    patterns.each do |pattern|
      #p "with pattern: #{pattern} "
      raw_locations = @game.rack.find_locations(pattern, 'all')
      winning_moves << raw_locations.flatten.uniq.map(&:address)
    end

    filtered_winning_moves = winning_moves.flatten.uniq
    #p "find locations DISPLAY: #{filtered_winning_moves}"

    playable_cells = @game.rack.playable_cells
    #p "playable cells : #{playable_cells}"


    actual_winning_moves = filtered_winning_moves & playable_cells

    #p "ACTUAL winning moves: #{actual_winning_moves}"
    actual_winning_moves
  end


  def create_patterns(want_to_win)
    patterns = []

    if want_to_win
      icon = @icon
    else
      icon = @icon == 'x' ? 'o' : 'x'
    end

    patterns << icon + icon + icon + ' '
    patterns << icon + icon + ' ' + icon
    patterns << icon + ' ' + icon + icon
    patterns << ' ' + icon + icon + icon

    patterns

  end

  def create_almost_patterns(want_to_win)
    patterns = []

    if want_to_win
      icon = @icon
    else
      icon = @icon == 'x' ? 'o' : 'x'
    end

    patterns << icon + icon + ' '
    patterns << icon + ' ' + icon
    patterns << ' ' + icon + icon

    patterns
  end


end