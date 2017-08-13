module Github::RepositoryOwner
  extend ActiveSupport::Concern

  included do
    has_many :repositories, as: :owner
  end
end
