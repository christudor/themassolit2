class LessonsController < ApplicationController
  
  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
  	@lesson = Lesson.new(key: params[:key])
  end

  def addlecture
    authorize! :view, :lesson, :message => 'Access limited to administrators only.'
    @lessonuploader = Lesson.new.lessonimage
    @lessonuploader.success_action_redirect = new_lesson_url
  end

  def edit
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
    @lesson = Lesson.find(params[:id])
  end

  def update
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(params[:lesson])
      flash[:success] = "Lecture updated"
      redirect_to lessons_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      redirect_to root_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
  	@lessons = Lesson.all
  end

  def destroy
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path, :notice => "Lecture deleted!"
  end

end
