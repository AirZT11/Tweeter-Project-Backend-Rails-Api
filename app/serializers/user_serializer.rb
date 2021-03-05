class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email
  has_many :tweets
  has_many :likes, through: :tweets
end
