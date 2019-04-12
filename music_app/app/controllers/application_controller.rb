class ApplicationController < ActionController::Base
  helper_method :current_user, :login, :logged_in?
  #app controller can access user model methods
  #helper_method makes these available to the views

  def login(user)
    session[session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    @current_user = nil
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

end
