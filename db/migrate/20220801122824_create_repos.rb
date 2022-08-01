class CreateRepos < ActiveRecord::Migration[7.0]
  def change
    create_table :repos do |t|
      t.text :repo_name

      t.timestamps
    end
  end
end
