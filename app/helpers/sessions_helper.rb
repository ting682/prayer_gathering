module SessionsHelper

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

end
