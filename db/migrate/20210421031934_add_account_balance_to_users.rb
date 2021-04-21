class AddAccountBalanceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :account_balance, :integer
  end
end
