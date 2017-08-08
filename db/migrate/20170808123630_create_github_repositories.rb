class CreateGithubRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :github_repositories do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :github_repositories, :name
  end
end
