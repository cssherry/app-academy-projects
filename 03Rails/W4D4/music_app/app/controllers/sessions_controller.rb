class SessionsController < ApplicationController
  before_action :redirect_if_not_logged_in, only: :destroy

  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])
    if @user.nil?
      flash.now[:errors] = ["No user with that combination of email/password"]
      render :new
    else
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    end
  end

  def new
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = ""
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password, :session_token)
  end
end
