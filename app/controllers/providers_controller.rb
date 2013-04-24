class ProvidersController < ApplicationController
  
  def show
	@provider = Provider.find(params[:id])
  end

  def new
  	@provider = Provider.new
  end

  def create
    @provider = Provider.new(params[:provider])
  end

  def index
  	@providers = Provider.paginate(page: params[:page])
  end

end
