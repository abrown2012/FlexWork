class TasksController < ApplicationController

    def new
        @task = Task.new
    end 

    def homepage
        render :homepage
    end

    def about
        render :about
    end

    def create
        @task = Task.new(task_params)
        if @task.save 
            session[:task_id] = @task.id 
            redirect_to @task
        else 
            render :new
        end 
    end 

    private
    def task_params 
        params.require(:job).permit(:name, :description, :price, :status, :category)
    end 

end
