class ProvidersController < ApplicationController
  load_and_authorize_resource :except => [:show]

  def show
    @provider = Provider.find(params[:id])
  end

  def new
  	@provider = Provider.new
  end

  def edit
    @provider = Provider.find(params[:id])
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.update_attributes(params[:provider])
      flash[:success] = "Tutor updated"
      redirect_to providers_path
    else
      render 'edit'
    end
  end

  def create
    @provider = Provider.new(params[:provider])
    if @provider.save
      redirect_to providers_path
    else
      render 'new'
    end    
  end

  def index
  	@providers = Provider.all
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
    redirect_to providers_path, :notice => "Tutor deleted."
  end

end