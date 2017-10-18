require 'bcrypt'

class User < ActiveRecord::Base

  validates :first_name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :reviews
  has_many :favorited_reviews, class_name: :ReviewUser, foreign_key: :user_id
  has_many :organizations, :through => :reviews

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
