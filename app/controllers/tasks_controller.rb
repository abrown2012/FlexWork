class TasksController < ApplicationController
    before_action :redirect_if_not_employer, only: [:new, :create, :edit]
    before_action :redirect_if_not_logged_in, only: [:show]
    before_action :assign_categories,    only: [:index, :new, :create, :edit]
     
    
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
        binding.pry
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


    def show     
        @task = Task.find(params[:id]) 
    end


    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @employers = User.is_an_employer
            @tasks = @user.tasks.includes(:employer)

        elsif params[:category_id]
            @category = Category.find_by_id(params[:category_id])
            @tasks = @category.tasks.includes(:employer)

        else
            @tasks = Task.all.includes(:employer)
        end
            
        if params[:sort]
            if params[:sort] == "name"
                @tasks = @tasks.order(:name)
            end
        else
            @tasks = @tasks.order(:name)
        end

        @tasks 
    end


    private
    def task_params 
        params.require(:task).permit(:name, 
            :description, 
            :price, 
            :status, 
            :location_type, 
            :city, 
            :state, 
            :zip, 
            :category_id
      
        )
    end 

    def assign_categories
        @categories = Category.all.order(:name)
    end

end
