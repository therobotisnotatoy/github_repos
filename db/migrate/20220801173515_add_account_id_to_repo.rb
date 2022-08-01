class AddAccountIdToRepo < ActiveRecord::Migration[7.0]
  def change
    add_column :repos, :account_id, :integer
    add_foreign_key :repos, :accounts
  end
end
