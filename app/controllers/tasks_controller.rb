class TasksController < ApplicationController
    before_action :redirect_if_not_employer, only: [:new, :create, :edit]
    before_action :redirect_if_not_logged_in, only: [:show]

     def new
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])

            if @user
                if @user.id != current_user.id
                    flash[:notice] = "You do not have access to this page"
                    redirect_to user_path( current_user )
                end
            else
                flash[:notice] = "Couldn't find user"
                redirect_to user_path( current_user )
            end
        end
        
        @task = Task.new
        @task.build_category
    end


    def homepage
        render :homepage
    end

    def about
        render :about
    end

    def create
        @task = Task.new(task_params)
        @task.employer_id = current_user.id
        

        if @task.valid?
            @task.save

            redirect_to task_path(@task)
        else
            @task.build_department

            render :new
        end
    end

    private
    def task_params 
        params.require(:job).permit(:name, :description, :price, :status, :category)
    end 

end
