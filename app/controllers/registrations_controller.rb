class RegistrationsController < Devise::RegistrationsController

  def new
    @plan = params[:plan]
    if @plan && ENV["ROLES"].include?(@plan) && @plan != "admin"
      super
    else
      redirect_to root_path, :notice => 'Please select a subscription plan below.'
    end
  end

  def update_plan
    @user = current_user
    role = Role.find(params[:user][:role_ids]) unless params[:user][:role_ids].nil?
    if @user.update_plan(role)
      redirect_to edit_user_registration_path, :notice => 'Updated plan.'
    else
      flash.alert = 'Unable to update plan.'
      render :edit
    end
  end

  def update_card
    @user = current_user
    @user.stripe_token = params[:user][:stripe_token]
    if @user.save
      redirect_to edit_user_registration_path, :notice => 'Updated card.'
    else
      flash.alert = 'Unable to update card.'
      render :edit
    end
  end

  def update
    @subscriber = Subscriber.find(current_subscriber.id)

    successfully_updated = if needs_password?(@subscriber, params)
      @subscriber.update_with_password(params[:subscriber])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:subscriber].delete(:current_password)
      @subscriber.update_without_password(params[:subscriber])
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the subscriber bypassing validation in case his password changed
      sign_in @subscriber, :bypass => true
      redirect_to after_update_path_for(@subscriber)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update subscriber data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(subscriber, params)
    subscriber.email != params[:subscriber][:email] ||
      params[:subscriber][:password].present?
  end

  def build_resource(*args)
    super
    if params[:plan]
      resource.add_role(params[:plan])
    end
  end
end