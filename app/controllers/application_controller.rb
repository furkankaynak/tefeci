class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :connected_user
  
  def connected_user
    @connected_user ||= User.find(session[:user]) if session[:user]
  end
end
