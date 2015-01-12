class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]

  def new
    @user = User.new
    #implicit render :new
  end

  def create
    if params[:confirm_password].nil?
      flash.now[:errors] = ["Please enter your password confirmation"]
      @user = User.new
      render :new
    elsif params[:confirm_password] != user_params[:password]
      flash.now[:errors] = ["Your passwords don't match"]
      @user = User.new
      render :new
    else
      @user = User.new(user_params)
      if @user.save
        session[:session_token] = @user.session_token
        redirect_to user_url(@user)
      else
        flash.now[:errors] = @user.errors.full_messages
        @user = User.new
        render :new
      end
    end


  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end
end
