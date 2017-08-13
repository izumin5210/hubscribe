class AddOwnerIdToGithubRepositories < ActiveRecord::Migration[5.1]
  def change
    add_column :github_repositories, :owner_id, :integer
    add_index :github_repositories, :owner_id
  end
end
