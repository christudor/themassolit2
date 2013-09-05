class CoursesController < ApplicationController
  
  def show
    @course = Course.find(params[:id])
  end

  def new
  	authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @course = Course.new
  end

  def edit
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @course = Course.find(params[:id])
  end

   def update
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:success] = "Course updated"
      redirect_to action: :show, id: @course.id
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @course = Course.new(params[:course])
    if @course.save
      redirect_to action: :show, id: @course.id
    else
      render 'new'
    end    
  end

  def destroy
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path, :notice => "Course deleted."
  end

  def index
  	@courses = Course.paginate(page: params[:page])
  end
end
