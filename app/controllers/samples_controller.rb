class SamplesController < ApplicationController

 def show
    @sample = Sample.find(params[:id])
  end

  def new
    authorize! :index, :sample, :message => 'Access limited to administrators only.'
    @sample = Sample.new(key: params[:key])
  end

  def addsample
    authorize! :view, :sample, :message => 'Access limited to administrators only.'
    @sampleuploader = Sample.new.sample
    @sampleuploader.success_action_redirect = new_sample_url
  end

  def edit
    authorize! :index, :sample, :message => 'Access limited to administrators only.'
    @sample = Sample.find(params[:id])
  end

  def update
    authorize! :index, :sample, :message => 'Access limited to administrators only.'
    @sample = Sample.find(params[:id])
    if @sample.update_attributes(params[:sample])
      flash[:success] = "Sample updated"
      redirect_to samples_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :sample, :message => 'Access limited to administrators only.'
    @sample = Sample.new(params[:sample])
    if @sample.save
      redirect_to root_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :sample, :message => 'Access limited to administrators only.'
    @samples = Sample.all
  end

  def destroy
    authorize! :index, :sample, :message => 'Access limited to administrators only.'
    @sample = Sample.find(params[:id])
    @sample.destroy
    redirect_to samples_path, :notice => "Sample deleted!"
  end

end
