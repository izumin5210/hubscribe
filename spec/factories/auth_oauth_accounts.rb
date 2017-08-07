# ## Schema Information
#
# Table name: `auth_oauth_accounts`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`id`**             | `integer`          | `not null, primary key`
# **`user_id`**        | `integer`          | `not null, indexed`
# **`uid`**            | `string`           | `not null, indexed => [provider]`
# **`provider`**       | `string`           | `not null, indexed => [uid]`
# **`name`**           | `string`           |
# **`nickname`**       | `string`           |
# **`email`**          | `string`           |
# **`url`**            | `string`           |
# **`image_url`**      | `string`           |
# **`access_token`**   | `string`           |
# **`access_secret`**  | `string`           |
# **`raw_info`**       | `text`             | `not null`
# **`credentials`**    | `text`             | `not null`
# **`created_at`**     | `datetime`         | `not null`
# **`updated_at`**     | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_auth_oauth_accounts_on_uid_and_provider` (_unique_):
#     * **`uid`**
#     * **`provider`**
# * `index_auth_oauth_accounts_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_...`:
#     * **`user_id => users.id`**
#

FactoryGirl.define do
  factory :auth_oauth_account, class: 'Auth::OauthAccount' do
    user nil
    uid "MyString"
    provider "MyString"
    name "MyString"
    nickname "MyString"
    email "MyString"
    url "MyString"
    image_url "MyString"
    access_token "MyString"
    access_secret "MyString"
    raw_info "MyText"
    credential "MyText"
  end
end
