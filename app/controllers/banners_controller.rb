class BannersController < ApplicationController

  def show
    @banner = Banner.find(params[:id])
  end

  def new
    authorize! :index, :banner, :message => 'Access limited to administrators only.'
    @banner = Banner.new(key: params[:key])
  end

  def addbanner
    authorize! :view, :banner, :message => 'Access limited to administrators only.'
    @banneruploader = Banner.new.banner
    @banneruploader.success_action_redirect = new_banner_url
  end

  def edit
    authorize! :index, :banner, :message => 'Access limited to administrators only.'
    @banner = Banner.find(params[:id])
  end

  def update
    authorize! :index, :banner, :message => 'Access limited to administrators only.'
    @banner = Banner.find(params[:id])
    if @banner.update_attributes(params[:banner])
      flash[:success] = "Banner updated"
      redirect_to banners_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :banner, :message => 'Access limited to administrators only.'
    @banner = Banner.new(params[:banner])
    if @banner.save
      redirect_to root_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :banner, :message => 'Access limited to administrators only.'
    @banners = Banner.all
  end

  def destroy
    authorize! :index, :banner, :message => 'Access limited to administrators only.'
    @banner = Banner.find(params[:id])
    @banner.destroy
    redirect_to banners_path, :notice => "Banner deleted!"
  end

end
