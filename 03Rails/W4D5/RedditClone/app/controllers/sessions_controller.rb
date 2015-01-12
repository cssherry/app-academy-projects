class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(
      params[:session][:username],
      params[:session][:password]
    )

    if @user.nil?
      flash.now[:errors] = @user.errors.full_messages
      render :new
    else
      login_user!(@user)
      redirect_to subs_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end
end
