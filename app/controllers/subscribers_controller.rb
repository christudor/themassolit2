class SubscribersController < ApplicationController
  before_filter :authenticate_subscriber!
  before_filter :only_allow_admin, :only => [ :index, :update, :destroy ]
  
  def index
  	@subscribers = Subscriber.all
  end

  def show
  	@subscriber = Subscriber.find(params[:id])
  end

  def update
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.update_attributes(params[:subscriber], :as => :admin)
      redirect_to subscribers_path, :notice => "User updated."
    else
      redirect_to subscribers_path, :alert => "Unable to update subscriber."
    end
  end

  def destroy
    subscriber = Subscriber.find(params[:id])
    unless subscriber == current_subscriber
      subscriber.destroy
      redirect_to subscribers_path, :notice => "Subscriber deleted."
    else
      redirect_to subscribers_path, :notice => "Can't delete yourself."
    end
  end


  private

  def only_allow_admin
    redirect_to root_path, :alert => 'Not authorized as an administrator.' unless current_subscriber.has_role? :admin
  end

end
