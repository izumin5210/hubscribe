class AddOwnerTypeToRepository < ActiveRecord::Migration[5.1]
  def change
    add_column :github_repositories, :owner_type, :string
    add_index :github_repositories, [:owner_id, :owner_type]
  end
end
