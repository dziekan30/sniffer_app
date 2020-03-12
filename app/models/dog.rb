class Dog < ApplicationRecord
  # validates :active_status, status: true
  belongs_to :user
  has_many :images
  has_many :makeups
  has_many :breeds, through: :makeups
  has_many :users, through: :requests

end
