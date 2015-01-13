class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  def log_in
    @user.reset_session_token
    session[:token] = @user.session_token
  end

  def log_out
    current_user.reset_session_token
    session[:token] = nil
  end

  def redirect_if_logged_out
    redirect_to new_session_url unless current_user
  end
end
