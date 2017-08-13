# ## Schema Information
#
# Table name: `github_subscriptions`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`id`**             | `integer`          | `not null, primary key`
# **`subscriber_id`**  | `integer`          | `indexed`
# **`repository_id`**  | `integer`          | `indexed`
# **`created_at`**     | `datetime`         | `not null`
# **`updated_at`**     | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_github_subscriptions_on_repository_id`:
#     * **`repository_id`**
# * `index_github_subscriptions_on_subscriber_id`:
#     * **`subscriber_id`**
#
# ### Foreign Keys
#
# * `fk_rails_...`:
#     * **`repository_id => github_repositories.id`**
#

FactoryGirl.define do
  factory :github_subscription, class: 'Github::Subscription' do
    subscriber_id 1
    github_repository nil
  end
end
