class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(params[:teacher])
      redirect_to '/admin/users', :notice => "User updated."
    else
      redirect_to '/admin/users', :alert => "Unable to update teacher."
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    unless teacher == current_teacher
      teacher.destroy
      redirect_to '/admin/users', :notice => "Teacher deleted."
    else
      redirect_to '/admin/users', :notice => "Can't delete yourself."
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

end
