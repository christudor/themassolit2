class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
  	@student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to '/admin/users', :notice => "User updated."
    else
      redirect_to '/admin/users', :alert => "Unable to update student."
    end
  end

  def destroy
    student = Student.find(params[:id])
    unless student == current_student
      student.destroy
      redirect_to '/admin/users', :notice => "Student deleted."
    else
      redirect_to '/admin/users', :notice => "Can't delete yourself."
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

end
