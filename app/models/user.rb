class User < ActiveRecord::Base
  has_many :reviews
  has_many :organizations, :through => :reviews
end
