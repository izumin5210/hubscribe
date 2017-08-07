# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`login_name`**  | `string`           | `not null, indexed`
# **`name`**        | `string`           | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_users_on_login_name` (_unique_):
#     * **`login_name`**
#

class Auth::User < ::User
  has_many :oauth_accounts, class_name: Auth::OauthAccount.name

  def self.find_or_create_by_auth_params!(params, user: nil)
    ActiveRecord::Base.transaction do
      oa = Auth::OauthAccount.find_or_initialize_by_auth_params(params)
      (user&.becomes(Auth::User) || oa.user || Auth::User.new(login_name: oa.nickname)).tap do |u|
        u.name ||= oa.name unless u.persisted?
        u.save!
        u.oauth_accounts << oa
      end
    end
  rescue => e
    e.record.errors.each do |attr, error|
      errors.add(attr, error)
    end
  end
end
