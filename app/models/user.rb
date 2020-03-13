class User < ApplicationRecord
has_secure_password

has_many :owned_dogs, class_name: "Dog"
has_many :requests
has_many :requested_dogs, through: :requests, source: :dog

validates :email, presence: true, uniqueness: true
validates :phone_number, presence: true, uniqueness: true
validates :password, presence: true

end
