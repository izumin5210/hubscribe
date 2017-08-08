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
#
# ### Indexes
#
# * `index_github_repositories_on_name`:
#     * **`name`**
#

FactoryGirl.define do
  factory :github_repository, class: 'Github::Repository' do
    name "MyString"
  end
end
