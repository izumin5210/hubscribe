# ## Schema Information
#
# Table name: `github_subscriptions`
#
# ### Columns
#
# Name                        | Type               | Attributes
# --------------------------- | ------------------ | ---------------------------
# **`id`**                    | `integer`          | `not null, primary key`
# **`subscriber_id`**         | `integer`          | `indexed`
# **`github_repository_id`**  | `integer`          | `indexed`
# **`created_at`**            | `datetime`         | `not null`
# **`updated_at`**            | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_github_subscriptions_on_github_repository_id`:
#     * **`github_repository_id`**
# * `index_github_subscriptions_on_subscriber_id`:
#     * **`subscriber_id`**
#
# ### Foreign Keys
#
# * `fk_rails_...`:
#     * **`github_repository_id => github_repositories.id`**
#

class Github::Subscription < ApplicationRecord
  belongs_to :github_repository
end
