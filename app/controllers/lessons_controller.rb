class LessonsController < ApplicationController
  
  def show

    @lesson = Lesson.find(params[:id])

    @unique_lessontag_list = []
    Lesson.all.each do |lesson|
      @unique_lessontag_list << lesson.lessontag_list
    end
    @unique_lessontag_list.flatten!
    @unique_lessontag_list.uniq!

    if user_signed_in? 
      if current_user.rolable_type == "Student"
        school = School.find_by_id(current_user.rolable.school_id)
        if !school.active?
          redirect_to root_path, :notice => "Sorry, your school does not have access to this content!"
        elsif school.active?
        else
        end
      elsif current_user.rolable_type == "Teacher"
        school = School.find_by_id(current_user.rolable.school_id)
        if !school.active?
          redirect_to root_path, :notice => "Sorry, your school does not have access to this content!"
        elsif school.active?
        else
        end
      elsif current_user.rolable_type == "Member"
      elsif current_user.rolable_type == "OldMember"
      else
      end
    else
      redirect_to root_path, :notice => "Sorry, you need to be logged in to access this!"
    end

    @recs = []
    
    @lesson.lessontags.each do |tag|
      Lesson.tagged_with("#{tag.name}").each do |lesson|
        @recs << lesson
      end
    end

    @recs.flatten!
    @recs.uniq!

  end

  def lessondash
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
    @lessons = Lesson.all
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
      redirect_to '/admin/lectures'
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :lesson, :message => 'Access limited to administrators only.'
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      flash[:success] = "Lecture added"
      redirect_to '/admin/lectures'
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
    redirect_to '/admin/lectures', :notice => "Lecture deleted!"
  end

end
