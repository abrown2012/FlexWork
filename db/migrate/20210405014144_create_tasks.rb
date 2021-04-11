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
      t.integer :zip
     
      t.belongs_to :employer, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
