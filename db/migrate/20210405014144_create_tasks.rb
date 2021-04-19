class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.float :price, precision: 10, scale: 2
      t.string :status
      t.string :location_type
      t.string :city
      t.string :state
      t.string :zip
      t.integer :employer_id
      t.integer :contractor_id
      t.integer :category_id
      t.timestamps
    end
  end
end
