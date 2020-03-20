class Dog < ApplicationRecord
  # validates :active_status, status: true

  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  # a owner_id foreign key on the dogs table (but it's actually user_id)
  # assumes that I have a Owner class (but its actually User class)

  has_many :requests
  has_many :adopters, through: :requests, source: :user

  # belongs_to :user
  has_many :images
  has_many :makeups
  has_many :breeds, through: :makeups
  has_many :users, through: :requests

end
