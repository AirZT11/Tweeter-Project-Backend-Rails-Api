class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes

  has_one_attached :image

  validates :message, presence: true
  validates :message, length: { maximum: 280 }


  def get_image_url
    url_for(self.image)
  end

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followee_id FROM follows
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end

  def self.from_user(user)
    where("user_id = ?", user)
  end

end
