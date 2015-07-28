class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  protected
  def set_current_user
    User.current = current_user
  end

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