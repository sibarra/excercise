class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
    User.find(session[:user_id]) rescue nil
  end

  def authenticate_user!
    render file: 'public/404', format: :html, status: :not_found unless current_user
  end

end
