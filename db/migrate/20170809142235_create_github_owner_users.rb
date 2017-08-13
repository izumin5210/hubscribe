class CreateGithubOwnerUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :github_owner_users do |t|
      t.string :login_name, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :github_owner_users, :login_name, unique: true
    add_foreign_key :github_owner_users, :github_login_names, column: :login_name
  end
end
