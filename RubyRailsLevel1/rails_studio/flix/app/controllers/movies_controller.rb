class MoviesController < ApplicationController

	def index
		#@movies = ['No Country For Old Men','Fargo','The Man Who Had No Name']
		@movies = Movie.all

	end

	def show

		id = params[:id]
		@movie = Movie.find(id)
	end

end
