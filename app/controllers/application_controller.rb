class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def current_auth_resource
    if subscriber_signed_in?
      current_subscriber
    else
      current_user
    end
  end

  def authenticate_person!
    unless current_auth_resource
      authenticate_subscriber!
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_auth_resource)
  end

end