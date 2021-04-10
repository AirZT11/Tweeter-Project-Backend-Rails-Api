class TweetSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at
  belongs_to :user
  has_many :likes

  # has_one_attached :image
end
