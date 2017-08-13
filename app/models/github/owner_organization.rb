# ## Schema Information
#
# Table name: `github_owner_organizations`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`login_name`**  | `string`           | `indexed`
# **`name`**        | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_github_owner_organizations_on_login_name` (_unique_):
#     * **`login_name`**
#
# ### Foreign Keys
#
# * `fk_rails_...`:
#     * **`login_name => github_login_names.id`**
#

class Github::OwnerOrganization < ApplicationRecord
  include Github::RepositoryOwner
end
