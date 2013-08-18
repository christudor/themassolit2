class LessonsController < ApplicationController
	before_filter :signed_in_user
  
  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
  	@lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(params[:lesson])
  end

  def index
  	@lesson = Lesson.paginate(page: params[:page])
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
       
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
