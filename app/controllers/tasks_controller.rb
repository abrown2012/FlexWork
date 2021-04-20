class TasksController < ApplicationController
    before_action :redirect_if_not_employer, only: [:new, :create, :edit]
    before_action :redirect_if_not_logged_in, only: [:show]
    before_action :assign_categories,    only: [:index, :new, :create, :edit]
    skip_before_action :verify_authenticity_token 
    
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
        
        if params[:category_id] && @category = Category.find(params[:category_id])
            @task = Task.new(category_id: params[:category_id])
        else 
            @task = Task.new
            @task.build_category
        end 
    end

    def index 
       
        if params["search"]
            @tasks = Task.search_by_name(params["search"])

        elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
            if @user.account_type == 1 
            
                @tasks = []
                @my_tasks = Task.all 
                @my_tasks.each do |t|
                    if t.contractor_id == @user.id 
                        @tasks << t 
                    end 
                end 
                
            else 
                @tasks = []
                @my_tasks = Task.all 
                @my_tasks.each do |t|
                    if t.employer_id == @user.id 
                        @tasks << t 
                    end 
                end 
            
            end 
            @tasks
            
        else 
            @tasks = Task.all

        end 


    end 

    def take_task
        binding.pry
        @task = Task.find(params["id"])
        if @task.contractor_id == nil 
            @task.contractor_id= current_user.id 
            @task.status = 'TAKEN'
            @task.save 
        elsif @task.contractor_id== current_user.id && @task.status == 'TAKEN'
            @task.status = 'COMPLETED'
            @task.save 
        elsif @task.employer_id == current_user.id && @task.status == 'COMPLETED'
            @task.status = 'CLOSED'
            @task.save 
        end 
        redirect_to user_path( current_user )
    end

    def applications
        
        
    end 


    def homepage
        render :homepage
    end

    def about
        render :about
    end

    def create
        binding.pry
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
        @category = Category.find(params[:category_id]) if params[:category_id]
        @task.employer_id = current_user.id

        if  @task.save
            
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
