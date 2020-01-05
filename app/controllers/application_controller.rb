class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to(login_path) && return unless session[:user_id]
    @current_user = User.where(id: session[:user_id]).first
    redirect_to(login_path) if @current_user.nil?
  end
end
