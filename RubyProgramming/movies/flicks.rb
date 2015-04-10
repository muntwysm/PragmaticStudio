require_relative 'playlist'

movie1 = Movie.new('Training Day',5)
movie2 = Movie.new('No Country For Old Men',5)
movie3 = Movie.new('Nightcrawler',5)


playlist1 = Playlist.new("Kermit")
playlist1.add_movie(movie1)
playlist1.add_movie(movie2)
playlist1.add_movie(movie3)
playlist1.play(3)
