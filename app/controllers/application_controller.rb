class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  after_filter :store_location

  def store_location
    if (!request.fullpath.match("/subscribers") &&
      !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    case current_user.rolable_type
    when "Admin"
        return root_path
    when "Teacher"
        return root_path
    when "Student"
        return root_path
    when "Member"
        return root_path
    end
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
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

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end

  private

  def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
  end

  end

end