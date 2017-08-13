class CreateGithubOwnerOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :github_owner_organizations do |t|
      t.string :login_name
      t.string :name

      t.timestamps
    end
    add_index :github_owner_organizations, :login_name, unique: true
    add_foreign_key :github_owner_organizations, :github_login_names, column: :login_name
  end
end
