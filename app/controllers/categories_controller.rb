class CategoriesController < ApplicationController
    before_action :current_user

    def new 
        binding.pry
        @category = Category.new
        
    end 

    def create 
        binding.pry
        @category = Category.create(category_params(:name))
        if @category.valid?
            redirect_to @category
        else 
            render :new
        end 
    end 

    def show
        @category = Category.find(params[:id]) 
    end


    def index
        @categories = Category.all.includes(tasks: [:employer])
    end

    def edit 
    end 

    def update 
        @category = Category.update(category_params(:name))
        if @category.valid?
            redirect_to @category
        else 
            render :new
        end 
    end 

    def destroy 
        @category.destroy
    end 

    def category_params(*args)
        params.require(:category).permit(*args)
    end

end