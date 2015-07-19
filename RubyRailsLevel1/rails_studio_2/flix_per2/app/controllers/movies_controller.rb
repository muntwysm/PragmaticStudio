class MoviesController < ApplicationController
  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = 'Movie Updated Sucessfully!'
      redirect_to @movie
      #  redirect_to @movie, notice: "Movie successfully updated!"

    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    if @movie.save
      flash[:notice] = 'Movie Created Sucessfully!'
      redirect_to @movie
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = 'Movie Deleted Sucessfully!'
    redirect_to movies_url
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
  end
end
