class Review < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user
  has_many :favorites, class_name: :ReviewUsers, foreign_key: :review_id
end
