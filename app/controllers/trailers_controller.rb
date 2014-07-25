class TrailersController < ApplicationController

 def show
    @trailer = Trailer.find(params[:id])
  end

  def new
    authorize! :index, :trailer, :message => 'Access limited to administrators only.'
    @trailer = Trailer.new(key: params[:key])
  end

  def addtrailer
    authorize! :view, :trailer, :message => 'Access limited to administrators only.'
    @traileruploader = Trailer.new.trailer
    @traileruploader.success_action_redirect = new_trailer_url
  end

  def edit
    authorize! :index, :trailer, :message => 'Access limited to administrators only.'
    @trailer = Trailer.find(params[:id])
  end

  def update
    authorize! :index, :trailer, :message => 'Access limited to administrators only.'
    @trailer = Trailer.find(params[:id])
    if @trailer.update_attributes(params[:trailer])
      flash[:success] = "Trailer updated"
      redirect_to '/admin/trailers'
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :trailer, :message => 'Access limited to administrators only.'
    @trailer = Trailer.new(params[:trailer])
    if @trailer.save
      redirect_to '/admin/trailers'
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :trailer, :message => 'Access limited to administrators only.'
    @trailers = Trailer.all
  end

  def destroy
    authorize! :index, :trailer, :message => 'Access limited to administrators only.'
    @trailer = Trailer.find(params[:id])
    @trailer.destroy
    redirect_to '/admin/trailers', :notice => "Trailer deleted!"
  end

end
