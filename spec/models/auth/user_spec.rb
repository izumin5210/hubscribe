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

require 'rails_helper'

RSpec.describe Auth::User, type: :model do
  using RSpec::Parameterized::TableSyntax

  describe '.find_or_create_by_auth_params!' do
    include AuthHashMock::GitHub
    let(:current_user) { nil }
    let(:user) { Auth::User.find_or_create_by_auth_params!(auth_hash, user: current_user) }
    subject { user }

    # Shared contexts
    # ----------------------------------------------------------------
    shared_context 'user registered' do
      let(:login_name) { 'loginuser' }
      let!(:current_user) { create(:user, login_name: login_name) }
    end

    shared_context 'oauth_account registered' do
      let(:prev_name) { "prev-#{info['name']}" }
      let(:prev_nickname) { "prev-#{nickname}" }
      let(:login_name) { prev_nickname }
      let(:oauth_account) do
        Auth::OauthAccount.new(
          uid: uid,
          provider: provider,
          name: prev_name,
          nickname: prev_nickname,
          credentials: credentials.to_json,
          raw_info: raw_info.to_json,
        )
      end

      before do
        current_user.becomes(Auth::User).oauth_accounts << oauth_account if current_user.is_a? User
      end
    end

    # contexts 1
    # ----------------------------------------------------------------
    context 'when the user has not logged in' do
      context 'when the oauth account has not registered' do
        where(:record_class, :count) do
          Auth::User         | 1
          Auth::OauthAccount | 1
        end

        with_them do
          it { expect { subject }.to change { record_class.count }.by(count) }
        end

        it { is_expected.to be_persisted }
        its('oauth_accounts.size') { is_expected.to eq 1 }
        describe 'oauth accounts' do
          subject { user.oauth_accounts[0] }
          it { is_expected.to be_persisted }
          its(:name) { is_expected.to eq info['name'] }
          its(:nickname) { is_expected.to eq nickname }
          its(:credentials) { is_expected.to eq credentials.to_json }
          its(:raw_info) { is_expected.to eq raw_info.to_json }
        end
      end

      context 'when the oauth account has registered' do
        include_context 'user registered'
        include_context 'oauth_account registered'

        where(:record_class, :count) do
          Auth::User         | 0
          Auth::OauthAccount | 0
        end

        with_them do
          it { expect { subject }.to change { record_class.count }.by(count) }
        end

        its(:login_name) { is_expected.to eq login_name }
        it { expect(user.oauth_accounts[0].nickname).to eq nickname }
      end
    end

    # contexts 2
    # ----------------------------------------------------------------
    context 'when the user has logged in' do
      include_context 'user registered'

      context 'when the oauth account has not registered' do
        where(:record_class, :count) do
          Auth::User         | 0
          Auth::OauthAccount | 1
        end

        with_them do
          it { expect { subject }.to change { record_class.count }.by(count) }
        end

        context 'when the user has other oauth account' do
          where(:record_class, :count) do
            Auth::User         | 0
            Auth::OauthAccount | 1
          end

          with_them do
            it { expect { subject }.to change { record_class.count }.by(count) }
          end
        end
      end

      context 'when the oauth account has registered' do
        include_context 'oauth_account registered'

        where(:record_class, :count) do
          Auth::User         | 0
          Auth::OauthAccount | 0
        end

        with_them do
          it { expect { subject }.to change { record_class.count }.by(count) }
        end
      end
    end
  end
end
