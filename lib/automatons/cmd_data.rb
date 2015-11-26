class Commander_Data < Automaton
	def prepare_to_play
		@moves = populate_moves
	end

	def move
		@moves.each do |pattern|
			matches = @game.rack.find_locations(pattern)
			cells_to_move = matches.flatten.uniq.map(&:address) & @game.rack.playable_cells

			if !cells_to_move.empty?
				cells_to_move.each do |cell|
					channel_num = cell[0,1].to_i
					return channel_num if !@game.rack.channel_full?(channel_num)
				end
			end

		end

		return 4
	end

	private
	def populate_moves

		if (self.team_name == 'oh')
			a = 'o'
			d = 'x'
		else
			a = 'x'
			d = 'o'
		end

		best_attack = [" ", a, a, a]
		best_defense = [" ", d, d, d]
		moves = []

		3.times do
			moves << best_attack.permutation.to_a.uniq.map{|a| a.join("")}
			moves << best_defense.permutation.to_a.uniq.map{|a| a.join("")}

			best_attack.pop
			best_defense.pop
		end

		moves.flatten

	end

end


