# ## Schema Information
#
# Table name: `github_repositories`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`name`**        | `string`           | `not null, indexed`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`owner_id`**    | `integer`          | `indexed`
#
# ### Indexes
#
# * `index_github_repositories_on_name`:
#     * **`name`**
# * `index_github_repositories_on_owner_id`:
#     * **`owner_id`**
#

class Github::Repository < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
