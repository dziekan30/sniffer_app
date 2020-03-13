class Request < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :user_id, uniqueness: {scope: :dog_id}
end
