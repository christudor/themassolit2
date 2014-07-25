class RegistrationsController < Devise::RegistrationsController
  def create
    # Getting the user type that is send through a hidden field in the registration form.
    rolable_type = params[:user][:rolable_type]
    # Deleting the rolable_type from the params hash, won't work without this.
    params[:user].delete(:rolable_type)
    # Building the user, I assume.
    build_resource

    # create a new child instance depending on the given user type
    child_class = rolable_type.camelize.constantize
    resource.rolable = child_class.new(params[child_class.to_s.underscore.to_sym])

    # first check if child instance is valid
    # cause if so and the parent instance is valid as well
    # it's all being saved at once
    valid = resource.valid?
    valid = resource.rolable.valid? && valid

    # customized code end

    if valid && resource.save    # customized code
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def update_card
    if current_user.rolable_type == "Member"
      @member = current_user.rolable
      @member.stripe_token = params[:stripe_token]
      if @member.save
        redirect_to edit_user_registration_path, :notice => 'Updated card.'
      else
        flash.alert = 'Unable to update card.'
        render :edit
      end
    elsif current_user.rolable_type == "OldMember"
      @user = current_user
      @user.stripe_token = params[:stripe_token]
      if @user.save
        redirect_to edit_user_registration_path, :notice => 'Updated card.'
      else
        flash.alert = 'Unable to update card.'
        render :edit
      end
    else
    end     
      
  end

end