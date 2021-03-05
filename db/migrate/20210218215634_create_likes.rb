class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
        t.integer :user_id
        t.integer :tweet_id
        t.integer :likes_per_tweet
      t.timestamps
    end
  end
end
