class LoginsController < ApplicationController
  skip_before_action :authenticate_user
  layout 'application_login'

  def show
    @user = User.new
  end

  def create
    user = User.where(username: login_params[:username]).first
    if user&.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to(root_path)
    else
      redirect_to(login_path, alert: 'Username or Password Invalid')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(login_path, notice: 'Successfully logged out')
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
