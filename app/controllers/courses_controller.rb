class CoursesController < ApplicationController
  before_filter :signed_in_user
  
  def show
    @course = Course.find(params[:id])
  end

  def new
  	@course = Course.new
  end

  def create
    @course = Course.new(params[:course])
  end

  def index
  	@courses = Course.paginate(page: params[:page])
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
       
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
