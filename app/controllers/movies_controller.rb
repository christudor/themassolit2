class MoviesController < ApplicationController

 def show
    @movie = Movie.find(params[:id])
  end

  def new
    authorize! :index, :movie, :message => 'Access limited to administrators only.'
    @movie = Movie.new(key: params[:key])
  end

  def addmovie
    authorize! :view, :movie, :message => 'Access limited to administrators only.'
    @movieuploader = Movie.new.movie
    @movieuploader.success_action_redirect = new_movie_url
  end

  def edit
    authorize! :index, :movie, :message => 'Access limited to administrators only.'
    @movie = Movie.find(params[:id])
  end

  def update
    authorize! :index, :movie, :message => 'Access limited to administrators only.'
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      flash[:success] = "Movie updated"
      redirect_to '/admin/videos'
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :movie, :message => 'Access limited to administrators only.'
    @movie = Movie.new(params[:movie])
    if @movie.save
      redirect_to '/admin/videos'
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :movie, :message => 'Access limited to administrators only.'
    @movies = Movie.all
  end

  def destroy
    authorize! :index, :movie, :message => 'Access limited to administrators only.'
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to '/admin/videos', :notice => "Movie deleted!"
  end

end
