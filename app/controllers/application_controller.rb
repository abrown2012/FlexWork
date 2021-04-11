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

    def redirect_if_not_employer
        if !current_user.nil? && current_user.account_type != 2
            flash[:message] = "You must have an Employer account to view this page."
            redirect_to user_path(current_user)
        end
    end

    def redirect_if_not_logged_in
        redirect_to login_path, :notice => "You must log in to view this page." if !is_logged_in?
    end

end
