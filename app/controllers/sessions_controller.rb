class SessionsController < ApplicationController

    def new

        if logged_in? && current_user.host
            
            redirect_to gatherings_path

        elsif logged_in? && current_user.host == false
            
            redirect_to prayers_path
        end
    end

    def create
        
        #binding.pry
        if auth
            if @user = User.find_by(email_address: auth[:info][:email])
                session[:user_id] = @user.id
               
                redirect_to prayers_path
            else
                @user = User.new(email_address: auth[:info][:email], name: auth[:info][:name], password: SecureRandom.hex)
                
                if @user.save
                    session[:user_id] = @user.id
                    
                    redirect_to prayers_path
                else
                    flash[:error] = @user.errors.full_messages.to_sentence
                    render :new
                end
                
            end
            
        else
            @user = User.find_by(email_address: params[:user][:email_address])
            if @user && @user.authenticate(params[:user][:password])
            
                session[:user_id] = @user.id
                if @user.host
                    
                    redirect_to gatherings_path
                else
                    
                    redirect_to prayers_path
                end
                
            else
                flash[:error] = "Login error: email and password do not match records."
                redirect_to "/login"
            end

            
        end
        


    end

    def destroy
        session.delete :user_id
        redirect_to "/"
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
end
