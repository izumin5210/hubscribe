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

class Auth::OauthAccount < ApplicationRecord
  belongs_to :user, class_name: Auth::User.name

  # @params params [Hashie::Mash] The auth params
  # @return [Auth::OauthAccount] The first found or initialized record
  def self.find_or_initialize_by_auth_params(params)
    credentials = params['credentials']
    info = params['info']
    Auth::OauthAccount.find_or_initialize_by(
      uid: params['uid'],
      provider: params['provider']
    ).tap do |oa|
      oa.name = info['name']
      oa.nickname = info['nickname']
      oa.email = info['email']
      case oa.provider
      when 'github'
        oa.url = info['urls']['GitHub']
      end
      oa.image_url = info['image']
      oa.access_token = credentials['token']
      oa.access_secret = credentials['secret']
      oa.credentials = credentials.to_json
      oa.raw_info = params['extra']['raw_info'].to_json
    end
  end
end
