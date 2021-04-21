class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
        @user = User.new
    end 

    def employers
        @employers = User.is_an_employer
    end

    def create
        
        @user = User.new(user_params)
        if  @user.valid?
            binding.pry
            if @user.account_type == "2"
                @user.account_balance = 5000.0
                @user.save 
            else 
                @user.account_balance = 0
                @user.save
            end 
            session[:user_id] = @user.id 
            redirect_to @user, notice: "Your account was successfully created!"
        else 
            flash.now[:alert] = @user.errors.full_messages.to_sentence 
            render :new
        end 
    end 

  

    def show
        @user = User.find(params[:id])
    end

    def edit 
        @user = User.find(params[:id])
    end 

    def update 
        @user = User.find(params[:id])
        binding.pry
        if current_user.id == @user.id 
            if @user.update(user_params)
                redirect_to user_path( @user ), notice: "Your account was updated"
            else 
                render :edit
            end 
        else
            redirect_to user_path( @user ), notice: "You can only update your own account"
        end
    end 

    private
    def user_params 
        params.require(:user).permit(
            :first_name, 
            :last_name, 
            :email, 
            :password,
            :password_confirmation, 
            :account_type
        )
    end 
    
end
