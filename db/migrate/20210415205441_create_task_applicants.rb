class CreateTaskApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :task_applicants do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.timestamps
    end
  end
end
