class AdminController < ApplicationController
  
  def index
    @admins = Admin.all
  end

  def show
  	@admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      redirect_to '/admin/users', :notice => "User updated."
    else
      redirect_to '/admin/users', :alert => "Unable to update admin."
    end
  end

  def destroy
    admin = Admin.find(params[:id])
    unless admin == current_admin
      admin.destroy
      redirect_to '/admin/users', :notice => "Admin deleted."
    else
      redirect_to '/admin/users', :notice => "Can't delete yourself."
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

end
