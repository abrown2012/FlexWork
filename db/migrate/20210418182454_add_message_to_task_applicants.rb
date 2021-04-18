class AddMessageToTaskApplicants < ActiveRecord::Migration[6.1]
  def change
    add_column :task_applicants, :message, :text
  end
end
