class ApplicationController < ActionController::Base  
  helper_method :current_user
  protect_from_forgery
  def current_user
    @current_user = nil
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
