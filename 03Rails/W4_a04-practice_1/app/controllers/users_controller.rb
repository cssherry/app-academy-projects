class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      session[:session_token] = @user.session_token
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def index
    @users = User.all
  end

  private
  def user_param
    params.require(:user).permit(:password, :username)
  end
end
