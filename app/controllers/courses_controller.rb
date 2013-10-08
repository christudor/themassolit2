class CoursesController < ApplicationController
  
  def show
    authorize! :view, :course, :message => 'Access limited to subscribers only.'
    @course = Course.find(params[:id])
    @lessonuploader = Lesson.new.lessonimage
    @lessonuploader.success_action_redirect = new_lesson_url
  end

  def new
  	authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @course = Course.new(key: params[:key])
  end

  def addcourse
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @uploader = Course.new.avatar
    @uploader.success_action_redirect = new_course_url
  end

  def coursedash
    @courses = Course.all
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
      redirect_to coursedash_path
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
    redirect_to coursedash_path, :notice => "Course deleted."
  end

  def index
  	@courses = Course.paginate(page: params[:page])
  end
end
