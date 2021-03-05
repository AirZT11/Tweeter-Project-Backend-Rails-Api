class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :tweet_id, :likes_per_tweet
  belongs_to :tweet
  belongs_to :user
end
