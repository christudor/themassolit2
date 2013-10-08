class ProvidersController < ApplicationController

  def show
	  @provider = Provider.find(params[:id])
  end

  def new
    authorize! :index, :provider, :message => 'Access limited to administrators only.'
  	@provider = Provider.new
  end

  def edit
    authorize! :index, :provider, :message => 'Access limited to administrators only.'
    @provider = Provider.find(params[:id])
  end

  def update
    authorize! :index, :provider, :message => 'Access limited to administrators only.'
    @provider = Provider.find(params[:id])
    if @provider.update_attributes(params[:provider])
      flash[:success] = "Tutor updated"
      redirect_to providers_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :provider, :message => 'Access limited to administrators only.'
    @provider = Provider.new(params[:provider])
    if @provider.save
      redirect_to providers_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :provider, :message => 'Access limited to administrators only.'
  	@providers = Provider.all
  end

    def destroy
    authorize! :index, :provider, :message => 'Access limited to administrators only.'
    @provider = Provider.find(params[:id])
    @provider.destroy
    redirect_to providers_path, :notice => "Tutor deleted."
  end


end
