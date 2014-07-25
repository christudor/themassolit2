class SchoolsController < ApplicationController
before_filter :authenticate_user!
load_and_authorize_resource

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new(params[:id])
  end

  def create
    @school = School.new(params[:school])
    if @school.save
      redirect_to schools_path
    else
      render 'new'
    end    
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      flash[:success] = "School updated"
      redirect_to schools_path
    else
      render 'edit'
    end
  end

  def index
    @schools = School.all
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    redirect_to schools_path, :notice => "School deleted!"
  end

end
