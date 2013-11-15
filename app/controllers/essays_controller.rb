class EssaysController < ApplicationController

 def show
    @essay = Essay.find(params[:id])
  end

  def new
    authorize! :index, :essay, :message => 'Access limited to administrators only.'
  	@essay = Essay.new(params[:id])
  end

  def edit
    authorize! :index, :essay, :message => 'Access limited to administrators only.'
    @essay = Essay.find(params[:id])
  end

  def update
    authorize! :index, :essay, :message => 'Access limited to administrators only.'
    @essay = Essay.find(params[:id])
    if @essay.update_attributes(params[:essay])
      flash[:success] = "Essay updated"
      redirect_to essays_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :essay, :message => 'Access limited to administrators only.'
    @essay = Essay.new(params[:essay])
    if @essay.save
      redirect_to essays_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :essay, :message => 'Access limited to administrators only.'
  	@essays = Essay.all
  end

  def destroy
    authorize! :index, :essay, :message => 'Access limited to administrators only.'
    @essay = Essay.find(params[:id])
    @essay.destroy
    redirect_to essays_path, :notice => "Essay deleted!"
  end

end
