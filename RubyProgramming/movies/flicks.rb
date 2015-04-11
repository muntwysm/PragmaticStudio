require_relative 'playlist'

movie1 = Movie.new('Training Day',5)
movie2 = Movie.new('No Country For Old Men',5)
movie3 = Movie.new('Nightcrawler',5)


playlist1 = Playlist.new("Kermit")
playlist1.load(ARGV.shift || 'movies.csv')

puts "How many viewings?"
#input_valid = /^[0-9]*$/.match(answer).nil? ? false : true

loop do
  puts "\nHow many viewings?('quit' to exit')"
  answer = gets.chomp.downcase
  case answer
  when /^[0-9]*$/
    #puts 'Enjoy your #{answer} viewings!'
    playlist1.play(answer.to_i)
  when 'quit','exit'
    playlist1.print_stats
    break
  else
    puts "Please enter number or 'quit' or 'exit'!"
  end

end

# require_relative 'playlist'

# movie1 = Movie.new('Training Day',5)
# movie2 = Movie.new('No Country For Old Men',5)
# movie3 = Movie.new('Nightcrawler',5)

# movies = [movie1,movie2,movie3]
