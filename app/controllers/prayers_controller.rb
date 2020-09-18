class PrayersController < ApplicationController

    before_action :require_login

    def index
        @user = current_user
        @prayers = @user.prayers
    end

    def new
        @user = current_user
         
        if @gathering = Gathering.find_by(id: params[:gathering_id])
            @prayer = Prayer.new(gathering_id: params[:gathering_id])
        else
            @prayer = Prayer.new
        end
        
    end

    def create
        #binding.pry
        @prayer = Prayer.new(prayer_params)
        if @prayer.save
            redirect_to prayer_path(@prayer)

        else
            flash[:error] = @prayer.errors.full_messages.to_sentence
            render :new
        end
        
    end

    def show
        @prayer = Prayer.find(params[:id])
    end

    def edit
        @prayer = Prayer.find(params[:id])
        @gathering = @prayer.gathering
    end

    def update
        @prayer = Prayer.find(params[:id])
        if @prayer.update(prayer_params)

            flash[:notice] = "Prayer updated successfully."
            
            redirect_to prayer_path(@prayer)

        else
            flash[:error] = @prayer.errors.full_messages.to_sentence
            render :edit
        end
    end

    def destroy
        @prayer = Prayer.find(params[:id])
        @prayer.destroy
        flash[:notice] = "Prayer deleted successfully."
        redirect_to prayers_path
    end

    private

    def prayer_params
        params.require(:prayer).permit(:title, :content, :user_id, :gathering_id)
    end


end
