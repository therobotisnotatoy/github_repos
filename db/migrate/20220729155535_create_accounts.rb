class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.text :nick_name, index: true
      t.text :user_name

      t.timestamps
    end
  end
end
