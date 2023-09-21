class AddOtherTweetToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :other_tweet_id, :integer
  end
end
