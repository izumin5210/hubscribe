class CreateGithubLoginNames < ActiveRecord::Migration[5.1]
  def change
    create_table :github_login_names, id: :string do |t|
    end
  end
end
