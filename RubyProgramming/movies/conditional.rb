require_relative 'movie'

movie = Movie.new('Godfather',10)

puts movie.rank == 10
puts movie.rank >= 10
puts movie.rank < 10


puts "hit" if movie.rank >= 10

puts 'flop' if movie.rank < 10

if movie.rank >= 10
	puts 'Hit'
else
	puts 'Flop'
end