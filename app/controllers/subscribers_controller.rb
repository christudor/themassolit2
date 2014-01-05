class SubscribersController < ApplicationController
  before_filter :authenticate_subscriber!
  before_filter :only_allow_admin, :only => [ :index, :update, :destroy ]
  
  def index
  	authorize! :index, :subscriber, :message => 'Access limited to administrators only.'
    @subscribers = Subscriber.all
  end

  def show
  	@subscriber = Subscriber.find(params[:id])
    @courses = @subscriber.studied_courses

    @school = @subscriber.school
    @subscriber_school = current_subscriber.school

    # Teachers are only able to view students at their own school.

    if current_subscriber.has_role? :validteacher
      if @subscriber.school != @subscriber_school
        redirect_to school_path(@subscriber_school), :notice => "You can only see statistics for students at your school"
      else
      end
    elsif current_subscriber.has_role? :invalidteacher
      if @subscriber.school != @subscriber_school
        redirect_to school_path(@subscriber_school), :notice => "You can only see statistics for students at your school"
      else
      end
    else 
    end

    # Students are only able to view themselves

    if current_subscriber.has_role? :validstudent
      if @subscriber.id != @current_subscriber.id
        redirect_to subscriber_path(@subscriber), :notice => "You can only view statistics for yourself!"
      else
      end
    elsif current_subscriber.has_role? :invalidstudent
       if @subscriber.id != @current_subscriber.id
        redirect_to subscriber_path(@subscriber), :notice => "You can only view statistics for yourself!"
      else
      end
    else
    end      

  end

  def update
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.update_attributes(params[:subscriber], :as => :admin)
      redirect_to subscribers_path, :notice => "User updated."
    else
      redirect_to subscribers_path, :alert => "Unable to update subscriber."
    end
  end

  def destroy
    subscriber = Subscriber.find(params[:id])
    unless subscriber == current_subscriber
      subscriber.destroy
      redirect_to subscribers_path, :notice => "Subscriber deleted."
    else
      redirect_to subscribers_path, :notice => "Can't delete yourself."
    end
  end

  def studying
    @title = "My Courses"
    @subscriber = Subscriber.find(params[:id])
    @courses = @subscriber.studied_courses.paginate(page: params[:page])
    render 'show_study'
  end

  private

  def only_allow_admin
    redirect_to subscribers_path, :alert => 'Not authorized as an administrator.' unless current_subscriber.has_role? :admin
  end

end
