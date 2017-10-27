class Business < ActiveRecord::Base
  has_many :addresses
  has_many :reviews
  has_many :customers, :through => :reviews, :source => :user


  def search_business(search)
  end
end
