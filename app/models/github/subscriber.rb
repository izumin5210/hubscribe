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

class Github::Subscriber < ::User
  has_many :subscriptions

  # Creates a new subscription to the given repository
  # @param [Github::Repositroy] a reposiitory
  # @return [Github::Subscription] a created subscription
  def subscribe(repo)
    subscriptions.create(repository: repo)
  end
end
