class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :status
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :contractor_id
      t.belongs_to :employer, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
