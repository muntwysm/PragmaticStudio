require_relative 'My_Enumerable'

class Song
  attr_reader :name, :artist, :duration
  FILENAMES = ['MP3',"WAV",'AAC']
  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def each_filename
    FILENAMES.each {|filename| yield "#{name.gsub(' ','-')}-#{artist.gsub(' ','-')}.#{filename}"}
  end
end


songs1 = Song.new('Thriller','Micheal Jackson',6)
puts songs1.each_filename {|filename| puts filename}
songs2 = Song.new('beat it','Micheal Jackson',5)

songs3 = Song.new('i think she knows','Justin Timberlake',5)

class Playlist
  include MyEnumerable
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each {|song|
      puts "Yielding #{song.name}..."
      yield(song)
    }
  end

  def play_songs
    self.each {|song| song.play}
  end

  def each_tagline
    each {|song| puts "#{song.name} - #{song.artist}" }
  end

  def each_by_artist (artist)
    self.my_select {|song| song.artist == artist}
  end

end

playlist = Playlist.new('r & b playlist')
playlist.add_song(songs1)
playlist.add_song(songs2)
playlist.add_song(songs3)

#playlist.each { |song| song.play }
playlist.play_songs

okie_songs = playlist.my_select { |song| song.name =~ /Okie/ }
p okie_songs

playlist.each_tagline { |tagline| puts tagline }

mj_song = playlist.each_by_artist("Micheal Jackson") { |song| song.play }
p mj_song

non_okie_songs = playlist.my_reject { |song| song.name =~ /Thriller/ }
p non_okie_songs

p playlist.my_detect { |song| song.artist == "Micheal Jackson" }

p playlist.my_any? { |song| song.artist == "Justin Timberlake" }

total_duration = playlist.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration
