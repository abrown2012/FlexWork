module ApplicationHelper

    def current_user
        if session[:employer_id]
            @current_user ||= User.find_by_id(session[:employer_id]) 
        elsif session[:contractor_id]
            @current_user ||= User.find_by_id(session[:contractor_id]) 
        end 
    end
    
end
