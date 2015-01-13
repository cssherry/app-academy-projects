class SessionsController < ApplicationController
  def new
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Cannot find user/password combination"]
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
