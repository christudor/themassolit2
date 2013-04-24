class CoursesController < ApplicationController
  
   def show
    @course = Course.find(params[:id])
  end

  def new
  	@course = Course.new
  end

  def create
    @course = Course.new(params[:course])
  end

  def index
  	@courses = Course.paginate(page: params[:page])
  end

end
