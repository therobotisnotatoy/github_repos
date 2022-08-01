class CreateRepos < ActiveRecord::Migration[7.0]
  def change
    create_table :repos do |t|
      t.string :repo_name
      t.string :text

      t.timestamps
    end
  end
end
