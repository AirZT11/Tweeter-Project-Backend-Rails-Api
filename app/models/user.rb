class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :tweets, :dependent => :destroy
  has_many :likes, through: :tweets, :dependent => :destroy
  
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_one_attached :image
  
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  # validates :password, presence: true, length: { minimum: 6 }
  def get_image_url
    url_for(self.image)
  end

end
