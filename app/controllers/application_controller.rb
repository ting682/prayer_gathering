class ApplicationController < ActionController::Base

    

    def logged_in?
        if session[:user_id]
            true
        else
            false
        end
    end

    def current_user
        @user ||= User.find(session[:user_id])
    end

    def require_login
        if session.include? :user_id
        
        else
            flash[:error] = "You need to be logged in to perform this action."
            redirect_to "/login"
        end
    end
    

    def edit_destroy_authorization

        @user = current_user
        @gathering = Gathering.find(params[:id])
        #binding.pry
        if @user == @gathering.host

        else
            flash[:gatheringerror] = "You need to be the host to perform this action."
            redirect_to "/login"
        end
    end

    def create_authorization
        @user = current_user
        
        if @user.host

        else
            flash[:gatheringerror] = "You need to be a host to perform this action."
            redirect_to "/login"
        end
    end
  

end
