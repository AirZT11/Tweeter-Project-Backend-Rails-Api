class User < ApplicationRecord
  # include Rails.application.routes.url_helpers

  has_many :tweets, :dependent => :destroy
  has_many :likes, through: :tweets, :dependent => :destroy
  
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_one_attached :image
  
  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  # validates :email,
  # format: { with: /^(.+)@(.+)$/, message: "Email invalid"  },
  #           uniqueness: { case_sensitive: false },
  #           length: { minimum: 4, maximum: 254 }     
  validates :email, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  def get_image_url
    url_for(self.image)
  end

  def self.users_followed_by(user)
    followed_user_ids = user.followee_ids
    where(id: followed_user_ids)
  end

  def self.followers_from(user)
    follower_user_ids = user.follower_ids
    where(id: follower_user_ids)
  end

end
