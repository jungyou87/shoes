class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    
  end
  
  def current_user
    if session[:user_id]
      return User.find(session[:user_id]) 
    end

    return redirect_to '/'
  end

  helper_method :current_user

  private
    def require_login
      return redirect_to '/' unless session[:user_id]
    end

end
