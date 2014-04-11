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
    user = User.find(params[:id])
    if user.has_role? :admin
      redirect_to users_path, :notice => "Admins cannot be deleted."
    elsif user == current_user
      unless user.customer_id.nil?
        customer = Stripe::Customer.retrieve(user.customer_id)
        unless customer.nil? or customer.respond_to?('deleted')
          if customer.subscription.status == 'active'
            customer.cancel_subscription
          end
        end
      end
      user.destroy
      redirect_to root_path, :notice => "Bye! Thanks for using MASSOLIT! We hope to see you again soon!"
    else
      user.destroy
      redirect_to users_path, :notice => "User deleted"
    end
  end

  private

  def only_allow_admin
    redirect_to root_path, :alert => 'Not authorized as an administrator.' unless current_subscriber.has_role? :admin
  end

end