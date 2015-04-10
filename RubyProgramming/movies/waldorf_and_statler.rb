module WaldorfAndStatler

	def self.roll_die
		rand(1..6)
	end


	def self.review(movie)
		number_rolled = roll_die
		case number_rolled
			when 1..2
				movie.thumbs_down
			when 3..4
				puts movie.title +  ' was skipped.'
			else
				movie.thumbs_up
		end
	end
end


