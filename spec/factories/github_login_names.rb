# ## Schema Information
#
# Table name: `github_login_names`
#
# ### Columns
#
# Name      | Type               | Attributes
# --------- | ------------------ | ---------------------------
# **`id`**  | `string`           | `not null, primary key`
#

FactoryGirl.define do
  factory :github_login_name, class: 'Github::LoginName' do
    
  end
end
