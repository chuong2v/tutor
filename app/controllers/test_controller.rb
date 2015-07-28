class TestController < ApplicationController
  def index
    @user = User.find(24)
  end
  def search
    
  end
end
