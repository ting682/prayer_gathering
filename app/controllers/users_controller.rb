class UsersController < ApplicationController

    def home

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        

        if @user.save
            session[:user_id] = @user.id
            if @user.host
                redirect_to gatherings_path
            else
                redirect_to prayers_path
            end
            

        else
            
            flash[:error] = @user.errors.full_messages.to_sentence

            redirect_to "/signup"
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email_address, :host)
    end
    
end
