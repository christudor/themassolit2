class LessonsController < ApplicationController
  
  def show
    authorize! :view, :lesson, :message => 'Please sign up or log in to see modules.'
    @lesson = Lesson.find(params[:id])
    
    if subscriber_signed_in?
      @sub_scores = @lesson.scores.where(:subscriber_id => current_subscriber.id)
    elsif user_signed_in?
      @sub_scores = @lesson.scores.where(:user_id => current_user.id)
    else
    end

    @id = @lesson.id
    @prev = @lesson.previous
    @next = @lesson.next
    respond_to do |format|
      format.html
    end
  end

  def new
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
  	@lesson = Lesson.new(params[:id])
  end

  def addlecture
    authorize! :view, :lesson, :message => 'Access limited to administrators only.'
    @videouploader = Lesson.new.video
    @videouploader.success_action_redirect = new_lesson_url
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
      flash[:success] = "Lecture added"
      redirect_to lessons_path
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
