class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def authenticate_user!
    session[:user].blank? ? log_out : check_user
  end

  def log_out
    reset_session
    redirect_to root_url
  end

  def check_user
    @current_user = User.find(session[:user])
    # user.blank? ? log_out : set_user_object
    log_out if @current_user.blank?
  end

end
