class ProvidersController < ApplicationController
  before_filter :signed_in_user

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

  private

    def signed_in_user
      unless signed_in?
        store_location
       
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
