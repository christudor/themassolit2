class HandoutsController < ApplicationController

def show
    @handout = Handout.find(params[:id])
  end

  def new
    authorize! :index, :handout, :message => 'Access limited to administrators only.'
  	@handout = Handout.new(key: params[:key])
  end

  def addhandout
    authorize! :view, :handout, :message => 'Access limited to administrators only.'
    @handoutuploader = Handout.new.handout
    @handoutuploader.success_action_redirect = new_handout_url
  end

  def edit
    authorize! :index, :handout, :message => 'Access limited to administrators only.'
    @handout = Handout.find(params[:id])
  end

  def update
    authorize! :index, :handout, :message => 'Access limited to administrators only.'
    @handout = Handout.find(params[:id])
    if @handout.update_attributes(params[:handout])
      flash[:success] = "Handout updated"
      redirect_to handouts_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :handout, :message => 'Access limited to administrators only.'
    @handout = Handout.new(params[:handout])
    if @handout.save
      redirect_to root_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :handout, :message => 'Access limited to administrators only.'
  	@handouts = Handout.all
  end

  def destroy
    authorize! :index, :handout, :message => 'Access limited to administrators only.'
    @handout = Handout.find(params[:id])
    @handout.destroy
    redirect_to handouts_path, :notice => "Handout deleted!"
  end

end