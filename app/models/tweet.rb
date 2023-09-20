class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  belongs_to :bookmark

  has_many :hashtags_tweets
  has many :hashtags, through: :hashtags_tweets

  has_many :response_tweets, class_name: "Tweet", foreign_key: "other_tweet_id"
  belongs_to :tweet, class_name: "Tweet", optional: true

  enum type: {
    quote: 'QUOTE',
    reply: 'REPLY',
    retweet: 'RETWEET',
    thread: 'THREAD'
  }
end
