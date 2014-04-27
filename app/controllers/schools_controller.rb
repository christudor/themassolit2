class SchoolsController < ApplicationController
  before_filter :authenticate_person!
  helper_method :sort_column, :sort_direction

  def show
    authorize! :view, :school, :message => 'Access limited to teachers only.'

    @school = School.find(params[:id])
    
    @subscriber = Subscriber.find_by_id(current_subscriber.id)
    @subscriber_school = @subscriber.school

    if @school.id != @subscriber.school.id
      redirect_to school_path(@subscriber_school) unless current_subscriber.has_role? :admin
    else
    end

  end

  def new
  	authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.new(params[:id])
  end

  def create
    authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.new(params[:school])
    if @school.save
      redirect_to schools_path
    else
      render 'new'
    end    
  end

  def edit
    authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.find(params[:id])
  end

  def update
    authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      flash[:success] = "School updated"
      redirect_to schools_path
    else
      render 'edit'
    end
  end

  def index
  	authorize! :index, :school, :message => 'Access limited to administrators only.'
    @schools = School.order("created_at")
  end

  def destroy
    authorize! :index, :school, :message => 'Access limited to administrators only.'
    @school = School.find(params[:id])
    @school.destroy
    redirect_to schools_path, :notice => "School deleted!"
  end

  private

  def sort_column
    School.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
   
end
