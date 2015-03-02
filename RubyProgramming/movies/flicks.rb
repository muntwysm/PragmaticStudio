def weekday
	current_time = Time.new
	current_time.strftime("%A")
end

class Movie
	#attr_accessor: title,rank
	def initialize(title,rank)
		@rank = rank
		@title = title
	end

	def to_s
 		"#{@title} has rank #{@rank}"
	end

	def ThumbsUp
		@rank += 1
	end

	def ThumbsDown
		@rank -= 1
	end
end

def movie_listing (title, rank = 0)
	" #{weekday.upcase}: #{title.capitalize} has a rank of #{rank}."
end

x = Movie.new('Training Day',5)

x.ThumbsUp

x.ThumbsDown

x.ThumbsDown

puts x
