class EmployersController < ApplicationController
    def new
        @employer = Employer.new
    end 

    def create
       
        @employer = Employer.new(employer_params)
        if @employer.save 
            session[:employer_id] = @employer.id 
            redirect_to @employer, notice: "Your account was successfully created!"
        else 
            flash.now[:alert] = @employer.errors.full_messages.to_sentence 
            render :new
        end 
    end 


    private
    def employer_params 
        params.require(:employer).permit(:username, :first_name, :last_name, :email, :password)
    end 
    
end
