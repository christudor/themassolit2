class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @course = Course.find(params[:relationship][:course_id])
    current_user.study!(@course)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @course = Relationship.find(params[:id]).course
    current_user.unstudy!(@course)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end