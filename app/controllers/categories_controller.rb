class CategoriesController < ApplicationController
    before_action :current_user

    def index
        @categories = Category.all.includes(tasks: [:employer])
    end
end