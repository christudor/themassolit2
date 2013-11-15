class SourcesController < ApplicationController

 def show
    @source = Source.find(params[:id])
  end

  def new
    authorize! :index, :source, :message => 'Access limited to administrators only.'
  	@source = Source.new(params[:id])
  end

  def edit
    authorize! :index, :source, :message => 'Access limited to administrators only.'
    @source = Source.find(params[:id])
  end

  def update
    authorize! :index, :source, :message => 'Access limited to administrators only.'
    @source = Source.find(params[:id])
    if @source.update_attributes(params[:source])
      flash[:success] = "Source updated"
      redirect_to sources_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :source, :message => 'Access limited to administrators only.'
    @source = Source.new(params[:source])
    if @source.save
      redirect_to sources_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :source, :message => 'Access limited to administrators only.'
  	@sources = Source.all
  end

  def destroy
    authorize! :index, :source, :message => 'Access limited to administrators only.'
    @source = Source.find(params[:id])
    @source.destroy
    redirect_to sources_path, :notice => "Source deleted!"
  end

end
