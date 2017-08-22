class SessionsController < ApplicationController

    before_action :require_login, only: [:destroy]
    
    def create
        @user = User.find_by_email(params[:email])
            if @user
                if @user.try(:authenticate, params[:password])
                    session[:user_id] = @user.id
                    flash[:notice] = ["Logged in successfully"]
                    return redirect_to '/shoes'
                end
                flash[:errors] = ["Incorrect password"]
                return redirect_to :back
            end
        flash[:errors] = ["Email not found"]
        return redirect_to :back
        
    end

    def destroy
        session.clear
        flash[:notice] = ["Logged out successfully"]
        return redirect_to '/'
    end

end
