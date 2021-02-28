class User < ApplicationRecord
  has_many :tweets
  has_many :likes, through: :tweets
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  # validates :password, presence: true, length: { minimum: 6 }
end
