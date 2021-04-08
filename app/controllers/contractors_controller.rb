class ContractorsController < ApplicationController

    def new
        @contractor = Contractor.new
    end 

    def create
       
        @contractor = Contractor.new(contractor_params)
        if @contractor.save 
            session[:contractor_id] = @contractor.id 
            redirect_to @contractor, notice: "Your account was successfully created!"
        else 
            flash.now[:alert] = @contractor.errors.full_messages.to_sentence 
            render :new
        end 
    end 

    private
    def contractor_params 
        params.require(:contractor).permit(:username, :first_name, :last_name, :email, :password)
    end 


end
