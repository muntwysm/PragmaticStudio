class MoviesController < ApplicationController

  def index
    @movies = Movie.released

  end

  def show
    id = params[:id].to_i
    @movie = Movie.find(id)
  end


  def edit
    id = params[:id].to_i
    @movie = Movie.find(id)
  end

  def update
    id = params[:id].to_i
    @movie = Movie.find(id)
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def new
    @movie = Movie.new
  end


  def create

    @movie = Movie.new(movie_params)
    @movie.save

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
  end

end
