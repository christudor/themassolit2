class CoursesController < ApplicationController
  
  def show
    @course = Course.find(params[:id])
  end

  def new
  	authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.new(key: params[:key])
  end

  def addcourse
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @uploader = Course.new.avatar
    @uploader.success_action_redirect = new_course_url
  end

  def coursedash
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @courses = Course.all
  end

  def edit
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.find(params[:id])
  end

   def update
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:success] = "Course updated"
      redirect_to coursedash_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.new(params[:course])
    if @course.save
      redirect_to action: :show, id: @course.id
    else
      render 'new'
    end    
  end

  def destroy
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to coursedash_path, :notice => "Course deleted."
  end

  def index
    @categories = Course.all_categories
    @courses = Course.select(params[:category])

    unless @categories.include?("Classics")
      redirect_to courses_path, :notice => "That category doesn't exist... yet."
    end
  end
end
