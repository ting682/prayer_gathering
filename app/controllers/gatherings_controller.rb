class GatheringsController < ApplicationController

    before_action :require_login
    before_action :edit_destroy_authorization
    before_action :create_authorization
    skip_before_action :edit_destroy_authorization, only: [:show, :index, :new, :create, :active]
    skip_before_action :create_authorization, only: [:show, :index, :edit, :update, :active]
    
    def active
        #binding.pry
        @gatherings = Gathering.active_gatherings
        render :active
    end

    def index
        #binding.pry

        @user = current_user
        
        @gatherings = Gathering.all

    end

    def new
        @gathering = Gathering.new
        @host = current_user
        #binding.pry
        @address = @gathering.build_address
        
    end

    def create
        
        @host = current_user
        @gathering = @host.gatherings.build(gathering_params)
        

        if @gathering.valid? && @gathering.address.valid? && @host.valid?
            
            @gathering.save
            @gathering.address.save
            @host.save
            #binding.pry
            flash[:notice] = "Gathering created successfully."
            redirect_to gathering_path(@gathering)

        else
            flash[:gatheringerror] = @gathering.errors.full_messages.to_sentence + @gathering.address.errors.full_messages.to_sentence
            render :new
        end

        
    
    end

    def show
        #raise params.inspect
        @user = current_user
        @gathering = Gathering.find(params[:id])
        #binding.pry

        @users = @gathering.users.uniq
    end

    def destroy
        @gathering = Gathering.find(params[:id])
        @gathering.destroy
        flash[:notice] = "Gathering deleted successfully."
        redirect_to gatherings_path
    end

    def edit
        @host = current_user
        @gathering = Gathering.find(params[:id])
    end
    
    def update
        @host = current_user
        @gathering = Gathering.find(params[:id])
        #@gathering.meeting_date = set_in_timezone(@gathering.meeting_date, gathering_params[:timezone])
        
        if @gathering.update(gathering_params) && @gathering.address.save
            flash[:notice] = "Gathering updated successfully."
            redirect_to gathering_path(@gathering)
        else
            flash[:gatheringerror] = @gathering.errors.full_messages.to_sentence + @gathering.address.errors.full_messages.to_sentence
            render :edit
        end
        #binding.pry
        #@gathering.address.update(gathering_update_address_params)
    end
    


    private



    def gathering_params
        params.require(:gathering).permit(:name, :meeting_date, :phone_number, :host_id, :url, :timezone, :address_attributes => [:address_1, :address_2, :city, :state, :zipcode])
    end





end
