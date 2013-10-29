class MoviesController < ApplicationController
  @@WHERE_FILTER_RATING='rating in (?)'
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end


  def index
    # search all ratings available for select tag
    @all_ratings=Movie.all_ratings
    redirect=false
    # pass params to session
    if params[:ratings]
      session[:ratings]=params[:ratings]
    elsif session[:ratings]
      par = session[:ratings]
      session.delete :ratings
      flash.keep
      params[:ratings]=par
      redirect=true
    end
    if params[:sort_title]
      session[:sort_title]=params[:sort_title]
      session.delete :sort_release_date
    elsif !params[:sort_release_date] && session[:sort_title]
      session.delete :sort_release_date
      flash.keep
      params.delete :sort_release_date
      params[:sort_title]=:asc
      redirect=true
    end
    if params[:sort_release_date]
      session[:sort_release_date]=params[:sort_release_date]
      session.delete :sort_title
    elsif !params[:sort_title] && session[:sort_release_date]
      session.delete :sort_title
      flash.keep
      params.delete :sort_title
      params[:sort_release_date]=:asc
      redirect=true
    end
    redirect_to movies_path(params) and return if redirect
    # get string with list of ratings selected
    lista=@all_ratings.select do  |r|
      session[:ratings] && session[:ratings][r]  == '1'
    end

    if lista.empty?
      lista=@all_ratings
      session[:ratings]=Hash.new
    end
    lista.each { |l| session[:ratings][l]='1'}
    # filter by params
    if params[:sort_title]
      @movies = Movie.where(@@WHERE_FILTER_RATING,lista).order("title  #{params[:sort_title].to_s} ")
      flash[:title]='hilite'
      flash[:release_date]=''
    elsif params[:sort_release_date]
      @movies = Movie.where(@@WHERE_FILTER_RATING,lista).order("release_date #{params[:sort_release_date].to_s}")
      flash[:release_date]='hilite'
      flash[:title]=''
    else
      @movies = Movie.where(@@WHERE_FILTER_RATING,lista)
      flash[:title],flash[:release_date]='',''
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
