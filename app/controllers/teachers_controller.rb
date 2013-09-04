class TeachersController < ApplicationController

	def new
	@teacher = Teacher.new
	end

  	def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      flash[:success] = "Thanks for your interest - we'll be in touch shortly!"
      redirect_to root_path      
    else
      render 'new'
    end
  end

  def edit
  end

  def index
  	@teachers = Teacher.all
  end

end