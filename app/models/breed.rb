class Breed < ApplicationRecord
  has_many :makeups
  has_many :dog, through: :makeups
end
