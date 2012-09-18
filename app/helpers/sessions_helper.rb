module SessionsHelper

def current_user
   @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
end
def signed_in?
    !current_user.nil?
end

def signed_in_user
    unless signed_in?
 
      redirect_to signin_path, :notice=> "Please sign in."
    end
  end

def sign_in(user)
   # cookies.permanent.signed[:remember_token] = [user.id, user.salt]
  session[:user_id] = user.id 
end
end
