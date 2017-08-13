class CreateGithubSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :github_subscriptions do |t|
      t.integer :subscriber_id
      t.references :github_repository, foreign_key: true

      t.timestamps
    end
    add_index :github_subscriptions, :subscriber_id
  end
end
