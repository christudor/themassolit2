class SubscribersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @subscribers = Subscriber.all
  end

  def show
  	@subscriber = Subscriber.find(params[:id])
    @courses = @subscriber.studied_courses

    @school = @subscriber.school
    @subscriber_school = current_subscriber.school

    # Teachers are only able to view students at their own school.

    unless current_subscriber.has_role? :admin
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
    end

    # Students are only able to view themselves
    unless current_subscriber.has_role? :admin
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
    end
  
    unless current_subscriber.has_role? :admin
      if current_subscriber.has_role? :validstudent
        if @subscriber.id != @current_subscriber.id
          redirect_to subscriber_path(current_subscriber), :notice => "You can only view statistics for yourself!"
        else
        end
      elsif current_subscriber.has_role? :invalidstudent
         if @subscriber.id != @current_subscriber.id
          redirect_to subscriber_path(current_subscriber), :notice => "You can only view statistics for yourself!"
        else
        end
      else
      end      
    end

  end

  def update
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.update_attributes(params[:subscriber])
      redirect_to '/admin/subscribers', :notice => "User updated."
    else
      redirect_to '/admin/subscribers', :alert => "Unable to update subscriber."
    end
  end

  def destroy
    subscriber = Subscriber.find(params[:id])
    unless subscriber == current_subscriber
      subscriber.destroy
      redirect_to '/admin/subscribers', :notice => "Subscriber deleted."
    else
      redirect_to '/admin/subscribers', :notice => "Can't delete yourself."
    end
  end

  def edit
    @subscriber = Subscriber.find(params[:id])
  end

  def studying
    @title = "My Courses"
    @subscriber = Subscriber.find(params[:id])
    @courses = @subscriber.studied_courses.paginate(page: params[:page])
    render 'show_study'
  end

end
