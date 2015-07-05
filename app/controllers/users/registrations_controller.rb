class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
before_filter :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/sign_up
  def new    
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # private
  # def user_params
  #   params.require(:post).permit(:title, :desc, :code, :user_id)
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
 def configure_permitted_parameters     
    @genders = Gender.all 
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:account_update) << :phone
    devise_parameter_sanitizer.for(:sign_up) << :address
    devise_parameter_sanitizer.for(:account_update) << :address
    devise_parameter_sanitizer.for(:sign_up) << :age
    devise_parameter_sanitizer.for(:account_update) << :age
    devise_parameter_sanitizer.for(:sign_up) << :gender_id
    devise_parameter_sanitizer.for(:account_update) << :gender_id
    devise_parameter_sanitizer.for(:sign_up) << :job
    devise_parameter_sanitizer.for(:account_update) << :job
    devise_parameter_sanitizer.for(:sign_up) << :role_id
    devise_parameter_sanitizer.for(:account_update) << :role_id

    # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end
end
