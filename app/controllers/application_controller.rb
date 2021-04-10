class ApplicationController < ActionController::Base
    helper_method :current_user, :is_logged_in?
    add_flash_types :success, :error, :warning, :info
    include ApplicationHelper

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id] != nil
    end

    def is_logged_in?
        session[:user_id] != nil
    end
end
