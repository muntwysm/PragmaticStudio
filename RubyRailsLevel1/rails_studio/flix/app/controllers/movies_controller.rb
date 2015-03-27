class MoviesController < ApplicationController

	def index
		#@movies = ['No Country For Old Men','Fargo','The Man Who Had No Name']
		@movies = Movie.released

	end

	def show
		id = params[:id]
		@movie = Movie.find(id)
	end

	def edit
		id = params[:id]
		@movie = Movie.find(id)
	end

	def update
		
		id = params[:id]
		@movie = Movie.find(id)
		#movie_params = params[:movie].permit(:title, :description, :rating, :released_on, :total_gross)
		@movie.update(movie_params);

		redirect_to @movie
	end

	def new
		@movie = Movie.new
		
	end


	def create
		@movie = Movie.new(movie_params)
		@movie.save
		redirect_to @movie
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.delete
		redirect_to @movie
	end


	private 

	def movie_params
		movie_params = params[:movie].permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
	end
end
