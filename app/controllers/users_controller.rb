class UsersController < ApplicationController
before_filter :authenticate_user!
load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end  

  def update
    @user = User.find(params[:id])
    @rolable = @user.rolable
    if @user.update_attributes(params[:user])
      redirect_to root_path, :notice => "User updated."
    else
      redirect_to root_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.rolable_type == "Admin"
      redirect_to root_path, :notice => "Admins cannot be deleted."
    elsif user == current_user
      if user.rolable_type == "Member"
        customer = Stripe::Customer.retrieve(Member.find_by_id(user.rolable_id).customer_id)
        customer.delete
      end
      user.destroy
      redirect_to root_path, :notice => "Thanks for using MASSOLIT"
    else
      if user.rolable_type == "Member"
        customer = Stripe::Customer.retrieve(Member.find_by_id(user.rolable_id).customer_id)
        customer.delete
      end
      user.destroy
      redirect_to 'admin/users', :notice => "User deleted"
    end
  end

end