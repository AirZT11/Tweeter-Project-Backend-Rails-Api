class TweetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :message, :created_at, :image
  belongs_to :user
  has_many :likes

  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end  

end
