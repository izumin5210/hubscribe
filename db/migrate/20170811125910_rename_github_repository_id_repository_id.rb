class RenameGithubRepositoryIdRepositoryId < ActiveRecord::Migration[5.1]
  def change
    rename_column :github_subscriptions, :github_repository_id, :repository_id
  end
end
