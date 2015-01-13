class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    current_user
  end

  def redirect_if_logged_out
    redirect_to new_session_url unless logged_in?
  end
end
