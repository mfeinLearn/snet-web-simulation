class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  private
  # checks to see if user is logged in by session hash with a key of
  # user_id which was set in the
  # user_controller#create (session[:user_id] = @user.id)
  def logged_in?
    !!session[:user_id]
  end

  # helper method to find the current user
  # by the session hash
  def current_user
    @user = User.find(session[:user_id])
  end
end
