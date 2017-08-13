# ## Schema Information
#
# Table name: `github_owner_users`
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
# * `index_github_owner_users_on_login_name` (_unique_):
#     * **`login_name`**
#
# ### Foreign Keys
#
# * `fk_rails_...`:
#     * **`login_name => github_login_names.id`**
#

class Github::OwnerUser < ApplicationRecord
  include Github::RepositoryOwner
end
