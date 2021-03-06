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
# **`owner_id`**    | `integer`          | `indexed, indexed => [owner_type]`
# **`owner_type`**  | `string`           | `indexed => [owner_id]`
#
# ### Indexes
#
# * `index_github_repositories_on_name`:
#     * **`name`**
# * `index_github_repositories_on_owner_id`:
#     * **`owner_id`**
# * `index_github_repositories_on_owner_id_and_owner_type`:
#     * **`owner_id`**
#     * **`owner_type`**
#

FactoryGirl.define do
  factory :github_repository, class: 'Github::Repository' do
    name "MyString"
  end
end
