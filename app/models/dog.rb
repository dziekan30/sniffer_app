class Dog < ApplicationRecord
  include Rails.application.routes.url_helpers

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

  enum size: { "small" => 0, "medium" => 1, "large" => 2, "teacup" => 3 }

  def default_image_url
    if images.any?
      rails_blob_url(images.first.file, host: "http://localhost:3000")
    else
      "https://media.istockphoto.com/photos/paw-icon-on-isolated-white-background-3d-illustration-picture-id1011867476?k=6&m=1011867476&s=612x612&w=0&h=cjo2nq0GgpenLcpSNdfXTiK2htPQ_znTrjl0M24LNzw="
    end
  end
end
