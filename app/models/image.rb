class Image < ApplicationRecord
  has_one_attached :file
  belongs_to :dog
end
