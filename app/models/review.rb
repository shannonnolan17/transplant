class Review < ActiveRecord::Base
  #validations?
  belongs_to :organization
  belongs_to :user
end
