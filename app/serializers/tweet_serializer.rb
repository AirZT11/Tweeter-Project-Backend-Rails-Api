class TweetSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at
  belongs_to :user
end
