class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def log_in user
    session[:token] = user.session_token
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def redirect_if_logged_out
    unless current_user
      flash[:errors] = ["Please log in"]
      redirect_to new_session_url
    end
  end

  def log_out
    current_user.reset_session_token!
    session[:token] = nil
  end
end
