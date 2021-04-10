class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :username, :email, :image
  
  has_many :tweets
  has_many :likes, through: :tweets

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end  
end
