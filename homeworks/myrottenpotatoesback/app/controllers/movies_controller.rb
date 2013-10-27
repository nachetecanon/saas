class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def show
    @movie = Movie.find(params[:id])
  end
  def new

  end
  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice]="#{@movie.title} has been succesfully created!"
    redirect_to movie_path
  end
end