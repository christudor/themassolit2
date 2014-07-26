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
    @courses = Course.all(:order => "name")
  end

   def update
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:success] = "Course updated"
      redirect_to '/admin/courses'
    else
      render 'edit'
    end
  end

  def edit
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.find(params[:id])
  end

  def create
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.new(params[:course])
    if @course.save
      redirect_to '/admin/courses'
    else
      render 'new'
    end    
  end

  def destroy
    authorize! :index, :course, :message => 'Access limited to administrators only.'
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to '/admin/courses', :notice => "Course deleted."
  end

  def index
    if params[:tag]
      @courses = Course.order("name").tagged_with(params[:tag]).paginate(page: params[:page], :per_page => 12)
      @title = "Courses on #{params[:tag]}"
    else
      @courses = Course.order("name").paginate(page: params[:page], :per_page => 12)
      @title = "All Courses"
    end

  end
end
