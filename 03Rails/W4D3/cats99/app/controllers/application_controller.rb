class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception

  def current_user
    user = User.find_by(session_token: session[:session_token])
    user.nil? ? nil : user
  end

  def redirect_if_logged_in
    redirect_to cats_url if current_user
  end

  def redirect_if_not_logged_in
    redirect_to new_session_url if current_user.nil?
  end
end
