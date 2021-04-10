class UsersController < ApplicationController
    def new
        
        @user = User.new
    end 

    def create
        binding.pry
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to @user, notice: "Your account was successfully created!"
        else 
            flash.now[:alert] = @user.errors.full_messages.to_sentence 
            render :new
        end 
    end 


    private
    def user_params 
        params.require(:user).permit(
            :username, 
            :first_name, 
            :last_name, 
            :email, 
            :password,
            :password_confirmation, 
            :account_type
        )
    end 
    
end
