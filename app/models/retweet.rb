class Retweet < ApplicationRecord
  belongs_to :retweeting_user, class_name: "User"
  belongs_to :retweeted_tweet, class_name: "Tweet"
  validates :retweed_tweet_id, uniqueness: true
  validates :retweeting_user_id, uniqueness: true
end
