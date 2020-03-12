class Request < ApplicationRecord
  belong_to :user
  belong_to :dog 
end
