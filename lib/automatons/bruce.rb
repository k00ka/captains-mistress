class Bruce < Automaton
	def prepare_to_play
		@channel = 1
	end

	def move
		@piece = (self.team_name == "ex") ? "x" : "o"
		channel = best_channel("#{@piece}#{@piece}#{@piece} ")
		channel = best_channel(" #{@piece}#{@piece}#{@piece}")
		channel = best_channel("#{@piece} #{@piece}#{@piece}")
		channel = best_channel("#{@piece}#{@piece} #{@piece}")
    unless channel
    	channel = best_channel(" #{@piece}#{@piece} ")
    	channel = best_channel(" #{@piece} #{@piece}")
    	channel = best_channel("#{@piece} #{@piece} ")
    	channel = best_channel("#{@piece}  #{@piece}")
    	channel = best_channel("  #{@piece}#{@piece}")
    	channel = best_channel("#{@piece}#{@piece}  ")
    	unless channel
    		@channel = @game.rack.playable_cells[0][0].to_i
    	else
    		@channel = channel
    	end
    else
    	@channel = channel
    end
	puts @channel
	@channel
	end

	def best_channel(pattern)
		locs = @game.rack.find_locations(pattern)
    return nil if locs.empty?
    playable = locs.flatten.uniq.map(&:address) & @game.rack.playable_cells
    return nil if playable.empty?
    playable[0][0].to_i
	end
end
