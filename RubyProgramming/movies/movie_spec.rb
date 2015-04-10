require_relative 'movie'

describe Movie do
	before do
		@inital_rank = 10
		@movie = Movie.new('goonies',@inital_rank)
	end

	it 'has a capitalized title' do
		@movie.title.should == 'Goonies'
	end

	it 'has an inital rank' do
		@movie.rank.should == 10
	end

	it 'has a string representation' do
		@movie.to_s.should == "Goonies has a rank of 10 and is a Hit!"
	end

	it 'increased rank by 1 when given a thumbs up' do
		@movie.thumbs_up
		@movie.rank.should == 11
	end

	it 'decreased rank by 1 when given a thumbs down' do
		@movie.thumbs_down
		@movie.rank.should == 9
	end

	context 'created with a default rank' do

		before do
			@movie = Movie.new('goonies')
		end

		it 'has a rank of 0' do
			@movie.rank.should == 0
		end
	end

	context 'with a rank of at least 10' do

		before do
			@movie = Movie.new('goonies',10)
		end

		it 'is a hit' do
			@movie.hit?.should == true
		end

		it 'has a hit status' do
			@movie.status.should == 'Hit!'
		end

	end

	context 'with a rank below 10' do
		before do
			@movie = Movie.new('The Avengers',9)
		end
		it 'is a flop' do
			@movie.flop?.should == true
		end

		it 'has a flop status' do
			@movie.status.should == 'Flop!'
		end



	end




end

