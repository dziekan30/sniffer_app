class User < ApplicationRecord
has_secure_password

has_many :dogs

validates :email, presence: true, uniqueness: true
validates :phone_number, presence: true, uniqueness: true
validates :password, presence: true

end
