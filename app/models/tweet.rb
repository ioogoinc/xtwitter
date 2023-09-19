class Tweet < ApplicationRecord
  enum type: {
    quote: 'QUOTE',
    reply: 'REPLY',
    retweet: 'RETWEET',
    thread: 'THREAD'
  }

  has_many :hashtags_tweets, class_name: HashtagTweet
  belongs_to :bookmark, class_name: Bookmark
  belongs_to :tweet, class_name: Tweet
  has_many :retweets, class_name: Tweet
  has_many :likes, class_name: Like

  belongs_to :user, class_name: User, foreign_key: :user_id
end
