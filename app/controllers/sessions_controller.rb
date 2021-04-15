class SessionsController < ApplicationController 
    def new
        @user = User.new
    end

    def omniauth
        @user = User.find_or_create_by(provider: auth[:provider], uid: auth[:uid]) do |u|
            u.first_name = auth[:info][:first_name]
            u.last_name = auth[:info][:last_name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(15)
        end

        if @user.valid?
            session[:user_id] = @user.id
            redirect_to root_path
           
        else
            flash[:notice] = "Oops, something did not work. Please try again"
            redirect_to login_path
        end
    end
    
    def create
        @user = User.find_by_email(params[:user][:email])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:notice] = "Invalid Username or Password"
            redirect_to login_path
        end
    end


    
    def destroy
        session.clear
        redirect_to root_path
    end

    private 
    
    def auth 
        request.env['omniauth.auth']
    end 
end 