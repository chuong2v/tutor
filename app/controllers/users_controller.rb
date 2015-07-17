class UsersController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  # before_action :authenticate_user!

  def show    
    @user = User.find(params[:id])
    @title = "Information: " + @user.username + " - Tutors"
  end

  def edit
    
  end
end
