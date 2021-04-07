class JobsController < ApplicationController

    def new
        @job = Job.new
    end 

    def create
        @job = Job.new(job_params)
        if @job.save 
            session[:job_id] = @job.id 
            redirect_to @job
        else 
            render :new
        end 
    end 

    private
    def job_params 
        params.require(:job).permit(:name, :description, :price, :status)
    end 

end
