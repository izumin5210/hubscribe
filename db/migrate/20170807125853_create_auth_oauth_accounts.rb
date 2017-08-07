class CreateAuthOauthAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :auth_oauth_accounts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :uid, null: false
      t.string :provider, null: false
      t.string :name
      t.string :nickname
      t.string :email
      t.string :url
      t.string :image_url
      t.string :access_token
      t.string :access_secret
      t.text :raw_info, null: false
      t.text :credentials, null: false

      t.timestamps
    end

    add_index :auth_oauth_accounts, [:uid, :provider], unique: true
  end
end
