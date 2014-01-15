class UsersController < ApplicationController
  before_filter :authenticate_person!

  def index
    authorize! :index, @user, :message => "This page is for admins only, I'm afraid!"
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      if current_user.id != @user.id
        redirect_to user_path(current_user), :notice => "You can only view statistics for yourself!"
      else
      end
    else
    end
  end

  def update
    authorize! :update, @user, :message => "This action can only be performed by admins!"
    @user = User.find(params[:id])
    role = Role.find(params[:user][:role_ids]) unless params[:user][:role_ids].nil?
    params[:user] = params[:user].except(:role_ids)
    if @user.update_attributes(params[:user])
      @user.update_plan(role) unless role.nil?
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :update, @user, :message => "This action can only be performed by admins!"
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  private

  def only_allow_admin
    redirect_to root_path, :alert => 'Not authorized as an administrator.' unless current_subscriber.has_role? :admin
  end

end