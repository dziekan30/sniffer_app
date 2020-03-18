class Breed < ApplicationRecord
  has_many :makeups
  has_many :dogs, through: :makeups
end
