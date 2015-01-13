class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.valid_password?(params[:user][:password])
      @user.reset_token!
      session[:session_token] = @user.session_token
      redirect_to links_url
    else
      flash.now[:errors] = ["No such username/password combination"]
      render :new
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.reset_token!
    session[:session_token] = ""
    redirect_to new_session_url
  end
end
