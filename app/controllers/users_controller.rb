class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :login]

  def index

  end

  def login
    @current_user = User.find_by(user_name: params[:user_name], password: Digest::MD5.hexdigest(params[:password]))
    if @current_user.present?
      session[:user] = @current_user.id
      redirect_to action: :home
    else
      log_out
    end
  end

  def home

  end

end
