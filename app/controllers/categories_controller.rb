class CategoriesController < ApplicationController
    before_action :current_user

    def new 
        @category = Category.new
    end 

    def create 
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

    

    def hottest_categories
        new_array = []
        categories = Category.all
        categories.each do |cat|
            cat.tasks.each do |cat_t|
                if cat_t.status = "OPEN"
                    new_array.push(cat.name)
                end 
            end
            new_array
        end
        counts = Hash.new 0
        new_array.each do |category|
              counts[category] += 1
            end
        @hottest_cat = counts.max_by{|k,v| v} 
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
        if @category.valid?
            @category.destroy
        else 
            redirect_to back
        end 
    end 

    def category_params(*args)
        params.require(:category).permit(*args)
    end

end