class SchoolsController < ApplicationController
  before_filter :authenticate_person!

  def show
    authorize! :view, :school, :message => 'Access limited to teachers only.'
    @school = School.find(params[:id])
  end

  def new
  	authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.new(params[:id])
  end

  def create
    authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.new(params[:school])
    if @school.save
      redirect_to schools_path
    else
      render 'new'
    end    
  end

  def edit
    authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.find(params[:id])
  end

  def update
    authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      flash[:success] = "School updated"
      redirect_to action: :show, id: @school.id
    else
      render 'edit'
    end
  end

  def index
  	authorize! :index, :school, :message => 'Access limited to administrators only.'
    @schools = School.paginate(page: params[:page])
  end

  def destroy
    authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.find(params[:id])
    @school.destroy
    redirect_to schools_path, :notice => "School deleted!"
  end

end
