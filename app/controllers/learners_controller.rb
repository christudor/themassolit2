class LearnersController < ApplicationController

	def new
	@learner = Learner.new
	end

  	def create
    @learner = Learner.new(params[:learner])
    if @learner.save
      flash[:success] = "Thanks for your interest - we'll be in touch shortly!"
      redirect_to :back
    else
      render 'new'
    end
  end

  def edit
  end

  def index
  	@learners = Learner.all
  end

end
