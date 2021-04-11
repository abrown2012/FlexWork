class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.text :name 
      t.belongs_to :task 
      t.timestamps
    end
  end
end
