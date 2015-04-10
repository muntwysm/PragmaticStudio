require_relative 'movie'

movie1 = Movie.new('Goldfinger',10)
movie2 = Movie.new('African Man',7)
movie3 = Movie.new("Seabiscuit",9)

movies = [movie1,movie2,movie3]

puts movies.sort


#puts movie1.rank <=> movie2.rank
#3.times { puts "Echo"  }
#
#1.upto(10) do |number|
#
#	puts "#{number} situp"
#	puts "#{number} pushup"
#	puts "#{number} abdominal"
#
#end