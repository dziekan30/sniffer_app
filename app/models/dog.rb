class Dog < ApplicationRecord
  include Rails.application.routes.url_helpers


  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  # a owner_id foreign key on the dogs table (but it's actually user_id)
  # assumes that I have a Owner class (but its actually User class)

  has_many :requests, dependent: :destroy
  has_many :adopters, through: :requests, source: :user

  # belongs_to :user
  has_many :images
  has_many :makeups, dependent: :destroy
  has_many :breeds, through: :makeups
  has_many :users, through: :requests

 

  enum size: { "small" => 0, "medium" => 1, "large" => 2, "teacup" => 3 }

  def default_image_url
    if images.any?
      # rails_blob_url(images.first.file, host: "http://localhost:3000")
      rails_blob_url(images.first.file )
    else
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTlfbdWcJoCo5nAcF7RNLHS6nDxoJcIPzXzRggD3VDxLpSlJh1q"
    end
    # return  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTlfbdWcJoCo5nAcF7RNLHS6nDxoJcIPzXzRggD3VDxLpSlJh1q"

  end
end
