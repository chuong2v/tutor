class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
before_filter :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
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
    
    # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end
end
