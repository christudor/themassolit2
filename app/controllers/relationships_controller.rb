class RelationshipsController < ApplicationController

  def create
    @course = Course.find(params[:relationship][:course_id])
    current_subscriber.study!(@course)
    redirect_to @course
  end

  def destroy
    @course = Relationship.find(params[:id]).course
    current_subscriber.unstudy!(@course)
    redirect_to @course
  end
end