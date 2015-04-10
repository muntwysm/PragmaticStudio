require_relative 'playlist'
require_relative 'waldorf_and_statler'

describe Playlist do 

	before do
		@playlist = Playlist.new('Kermit')
	end

	context 'being played with one movie' do

		before do
			@inital_rank = 10
			@movie = Movie.new('Godfather',@inital_rank)
			@playlist.add_movie(@movie)
		end

		it 'gives the movies a thumbs up if a high number is rolled' do
			WaldorfAndStatler.stub(:roll_die).and_return(6)
			@playlist.play
			@movie.rank.should == @inital_rank + 1
		end

		it 'skips the move if a medium number is rolled' do 
			WaldorfAndStatler.stub(:roll_die).and_return(4)
			@playlist.play
			@movie.rank.should == @inital_rank
		end

		it 'gives the movie a thumbs down if a low number is rolled' do
			WaldorfAndStatler.stub(:roll_die).and_return(2)
			@playlist.play
			@movie.rank.should == @inital_rank - 1
		end


	end

	it 'should have a name'  do
		playlist = Playlist.new ('Chris')

		playlist.name.should == 'Chris'
	end	
end