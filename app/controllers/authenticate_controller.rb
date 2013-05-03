class AuthenticateController < ApplicationController
  def login
    uid = auth_hash["uid"]
    name =  auth_hash["info"]["name"]
    user = User.find_by_uid(uid) || User.create_user(auth_hash)
    session[:user] = user.id
    session[:user_pic] = auth_hash['info']['image']
    redirect_to root_url
  end

  def logout
    reset_session
    redirect_to root_url
  end
  
  def auth_hash
    request.env["omniauth.auth"]
  end
end
