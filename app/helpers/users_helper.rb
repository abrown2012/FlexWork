module UsersHelper
    def render_account_type_for_form(f)
        if current_user.nil?
            render partial: 'select_account_type'
        else
            f.hidden_field :user_account_type, value: current_user.account_type
        end
    end

end
