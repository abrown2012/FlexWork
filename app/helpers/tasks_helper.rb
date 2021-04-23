module TasksHelper
    def display_tasks_conditionally 
        @tasks.map do |task| 
            if task.status == 'OPEN'
                tag.div class:"text-center box-border h-50 w-45 p-4 mb-5 border-4 rounded border-gray-800 " do 
                    concat render partial: "display_task", locals: {task: task}
                end 
                
            elsif task.contractor_id == current_user.id || task.employer_id == current_user.id 
                tag.div class:"text-center box-border h-50 w-45 p-4 mb-5 border-4 rounded border-gray-800 " do 
                    concat render partial: 'display_task', locals: {task: task}
                end 
            end 
        end.join.html_safe
    end 
end
