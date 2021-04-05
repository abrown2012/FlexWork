class CreateEmployers < ActiveRecord::Migration[6.1]
  def change
    create_table :employers do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :fist_name
      t.string :last_name

      t.timestamps
    end
  end
end
