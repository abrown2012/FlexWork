class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.number :price
      t.string :status
      t.belongs_to :employer, null: false, foreign_key: true
      t.belongs_to :contractor, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
