require_relative 'movie'

File.open('movies.csv') do |file|
  file.each_line do |line|
    puts line
  end
end

movies = []
File.readlines('movies.csv').each do |line|
  title,rank = line.split(',')
  movie = Movie.new(title, rank.to_i)
  movies.push(movie)
end

print movies

#file.close
