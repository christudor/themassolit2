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
    
    @unique_genre_list = []
    Course.all.each do |course|
      @unique_genre_list << course.genre_list
    end
    @unique_genre_list.flatten!
    @unique_genre_list.uniq!

    @unique_lessontag_list = []
    Lesson.all.each do |lesson|
      @unique_lessontag_list << lesson.lessontag_list
    end
    @unique_lessontag_list.flatten!
    @unique_lessontag_list.uniq!

    @unique_subgenre_list = []
    Course.all.each do |course|
      @unique_subgenre_list << course.subgenre_list
    end
    @unique_subgenre_list.flatten!
    @unique_subgenre_list.uniq!

    @unique_period_list = []
    Course.all.each do |course|
      @unique_period_list << course.period_list
    end
    @unique_period_list.flatten!
    @unique_period_list.uniq!

    @unique_text_list = []
    Course.all.each do |course|
      @unique_text_list << course.text_list
    end
    @unique_text_list.flatten!
    @unique_text_list.uniq!

    @unique_author_list = []
    Course.all.each do |course|
      @unique_author_list << course.author_list
    end
    @unique_author_list.flatten!
    @unique_author_list.uniq!

    @unique_examoption_list = []
    Course.all.each do |course|
      @unique_examoption_list << course.examoption_list
    end
    @unique_examoption_list.flatten!
    @unique_examoption_list.uniq!


    if params[:tag]
      @courses = Course.tagged_with(params[:tag])
      @title = "Courses on #{params[:tag]}"
    
    elsif params[:search_lessontag]
      @lessons = Lesson.tagged_with(params[:search_lessontag], :on => :lessontags, :order => "title")
      @title = "Search Results"
      
    elsif params[:search_name]
      @courses = Course.where("name = ?", params[:search_name])
      @title = "Search Results"
    elsif params[:search_genre]
      @courses = Course.tagged_with(params[:search_genre], :on => :genres)
      @title = "Search Results"
    elsif params[:search_subgenre]
      @courses = Course.tagged_with(params[:search_subgenre], :on => :subgenres)
      @title = "Search Results"
    elsif params[:search_text]
      @courses = Course.tagged_with(params[:search_text], :on => :texts)
      @title = "Search Results"
    elsif params[:search_author]
      @courses = Course.tagged_with(params[:search_author], :on => :authors)
      @title = "Search Results"
    elsif params[:search_period]
      @courses = Course.tagged_with(params[:search_period], :on => :periods)
      @title = "Search Results"
    elsif params[:search_examoption]
      @courses = Course.tagged_with(params[:search_examoption], :on => :examoptions)
      @title = "Search Results"
    else
      @courses = Course.all(:order => "name")
      @title = "All Courses"
    end



  end
end
