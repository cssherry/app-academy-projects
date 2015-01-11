class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def redirect_if_not_logged_in
    if current_user.nil?
      flash[:errors] = ["Please log in"]
      redirect_to new_session_url
    end
  end
end
