class SessionsController < ApplicationController
  def new
  @title= "sign_in"
  end

 def create
  user = User.find_by_email(params[:session][:email])
  if user && user.authenticate(params[:session][:password])
    if params[:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
    redirect_to :action => "index", :controller => "projects"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  cookies.delete(:auth_token)
  redirect_to root_url
end


end
