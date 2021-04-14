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

    def index 
        binding.pry
        if params["search"]
            @tasks = Task.search_by_name(params["search"])

        elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
            @tasks = @user.tasks 

        else 
            @tasks = Task.all
            
        end 


    end 


    def homepage
        render :homepage
    end

    def about
        render :about
    end

    def create
        @task = Task.new(task_params(:name, 
        :description, 
        :price, 
        :status, 
        :location_type, 
        :city, 
        :state, 
        :zip, 
        :category_id, 
        category_attributes: [:name]))

        @task.employer_id = current_user.id

        if @task.valid?
            @task.save

            redirect_to task_path(@task)
        else
            @task.build_category

            render :new
        end
    end


    def show     
        @task = Task.find(params[:id]) 
    end
 

    def edit 
        @task = Task.find(params[:id]) 
    end 

    def update 
        
        @task = Task.find(params[:id]) 
        @task.update(task_params(:name, 
        :description, 
        :price, 
        :status, 
        :location_type, 
        :city, 
        :state, 
        :zip, 
        :category_id, 
        category_attributes: [:name]))

        if @task.valid?
            @task.save

            redirect_to task_path(@task)
        else
            @task.build_category

            render :new
        end
    end 

    def destroy 
        
        binding.pry
        @task = Task.find(params[:id]) 
        if @task.destroy 
            redirect_to root_path
        else 
            redirect_to back
        end 
    end 

    private
    def task_params(*args)
        params.require(:task).permit(*args)
        
    end 

    def assign_categories
        @categories = Category.all.order(:name)
    end

end
